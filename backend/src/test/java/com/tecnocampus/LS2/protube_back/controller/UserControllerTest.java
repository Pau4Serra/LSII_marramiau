package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.UserResponseDTO;
import com.tecnocampus.LS2.protube_back.services.UserService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class UserControllerTest {

    @InjectMocks
    UserController userController;

    @Mock
    UserService userService;

    @Test
    void updateAndChangeDarkModeDelegateToService() {
        UUID id = UUID.randomUUID();
        UserResponseDTO request = new UserResponseDTO(id, "subject", "email", "Name", "Last", "picture", true);
        when(userService.update(id, request)).thenReturn(request);

        assertEquals(request, userController.updateUser(id, request));
        userController.changeDarkMode(id);

        verify(userService).changeDarkMode(id);
    }
}
