package com.tecnocampus.LS2.protube_back.controller;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class IndexControllerTest {
    IndexController indexController = new IndexController();

    @Test
    void servesTheReactEntryPointForApiDocumentation() {
        assertEquals("forward:/index.html", indexController.apiDocs());
    }

    @Test
    void home() {

        assertEquals("index", indexController.home().getViewName());
    }

    @Test
    void logout() {

        assertEquals("logout", indexController.logout().getViewName());
    }
}
