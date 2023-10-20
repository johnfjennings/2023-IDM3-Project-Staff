package com.idm3projectbasic;

import java.util.ArrayList;

import com.idm3projectbasic.model.Project;
import com.idm3projectbasic.model.Showcase;
import com.idm3projectbasic.model.User;

// Press Shift twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class Main {
    public static void main(String[] args) {
        // Press Alt+Enter with your caret at the highlighted text to see how
        // IntelliJ IDEA suggests fixing it.
        System.out.printf("Hello and welcome to the TUS Gallery!");
        ArrayList<Project> Gallery= new ArrayList<>();
        System.out.println("findAllProjectsRecentFirst");
        Project projects  = new Project();
        Gallery = projects.findAllProjectsRecentFirst();
        DisplayProjects(Gallery);

        System.out.println("find All Showcases");
        ArrayList<Showcase> ShowcaseGallery= new ArrayList<>();
        Showcase s = new Showcase();
        ShowcaseGallery = s.findAllLiveShowcases();
        DisplayShowcases(ShowcaseGallery);

        //create user
        User u = new User("firstName", "surname", "emailAddress", "ADMIN", "userName", "password222", "");
        u = u.createUser();
        System.out.println("user id =" + u.getUserId());
    }
    public static void DisplayProjects(ArrayList<Project> Gallery) {

        for (Project project : Gallery) {
            project.Print();
        }
    }
    public static void DisplayShowcases(ArrayList<Showcase> GallerySC) {

        for (Showcase showcase : GallerySC) {
            showcase.Print();
        }
    }
}