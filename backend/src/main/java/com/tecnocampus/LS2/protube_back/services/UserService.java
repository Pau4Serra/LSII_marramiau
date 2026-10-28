package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.User;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.UserResponseDTO;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public UserResponseDTO update(UUID id, UserResponseDTO userResponseDTO) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            user.setName(userResponseDTO.name());
            user.setLastname(userResponseDTO.lastname());
            userRepository.save(user);
        } else {
            throw new NullPointerException("This user doesn't exist");
        }
        return new UserResponseDTO(
                id,
                user.getGoogleSubject(),
                user.getEmail(),
                user.getName(),
                user.getLastname(),
                user.getPictureUrl()
        );
    }

    public void findOrCreateFromGoogle(String sub, String email, String name, String familyName, String picture) {
        User user = userRepository.findUserByGoogleSubject(sub);
        if(user == null) {
            User newUser = new User(
                    sub,
                    email,
                    name,
                    familyName,
                    picture
            );
            userRepository.save(newUser);
        } else {
            user.setGoogleSubject(sub);
            user.setEmail(email);
            user.setName(name);
            user.setLastname(familyName);
            user.setPictureUrl(picture);
            userRepository.save(user);
        }
    }
}
