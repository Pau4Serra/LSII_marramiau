package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.User;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.UserResponseDTO;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class UserServiceTest {

    @Mock
    UserRepository userRepository;

    @Test
    void getMeReturnsMappedUser() {
        UUID id = UUID.randomUUID();
        User user = new User("subject", "user@example.com", "Test", "User", "picture", false);
        user.setId(id);
        when(userRepository.findUserByGoogleSubject("subject")).thenReturn(user);

        UserResponseDTO response = new UserService(userRepository).getMe("subject");

        assertEquals(id, response.id());
        assertEquals("user@example.com", response.email());
    }

    @Test
    void getMeRejectsMissingUser() {
        when(userRepository.findUserByGoogleSubject("missing")).thenReturn(null);
        assertThrows(NullPointerException.class,
                () -> new UserService(userRepository).getMe("missing"));
    }

    @Test
    void findOrCreateCreatesAndUpdatesUsers() {
        UserService service = new UserService(userRepository);

        service.findOrCreateFromGoogle("new", "new@example.com", "New", "User", "new-picture", false);
        verify(userRepository).save(org.mockito.ArgumentMatchers.any(User.class));

        User existing = new User("subject", "old@example.com", "Old", "Name", "old-picture", false);
        when(userRepository.findUserByGoogleSubject("subject")).thenReturn(existing);
        service.findOrCreateFromGoogle("subject", "new@example.com", "New", "Name", "picture", true);

        assertEquals("new@example.com", existing.getEmail());
        verify(userRepository).save(existing);
    }

    @Test
    void updateAndDarkModeUpdateExistingUsers() {
        UUID id = UUID.randomUUID();
        User user = new User("subject", "old@example.com", "Old", "Name", "picture", false);
        when(userRepository.findById(id)).thenReturn(Optional.of(user));
        UserService service = new UserService(userRepository);

        service.update(id, new UserResponseDTO(id, "subject", "old@example.com", "New", "Lastname", "picture", false));
        service.changeDarkMode(id);

        assertEquals("New", user.getName());
        assertEquals("Lastname", user.getLastname());
        assertEquals(true, user.isDark_mode());
        verify(userRepository, times(2)).save(user);
    }

    @Test
    void updateAndDarkModeRejectMissingUsers() {
        UUID id = UUID.randomUUID();
        when(userRepository.findById(id)).thenReturn(Optional.empty());
        UserService service = new UserService(userRepository);

        assertThrows(NullPointerException.class,
                () -> service.update(id, new UserResponseDTO(id, null, null, null, null, null, false)));
        assertThrows(NullPointerException.class, () -> service.changeDarkMode(id));
    }
}
