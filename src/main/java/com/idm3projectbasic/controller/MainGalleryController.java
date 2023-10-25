package com.idm3projectbasic.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.idm3projectbasic.model.Project;
import com.idm3projectbasic.model.Showcase;
import com.idm3projectbasic.model.User;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

@WebServlet(name = "MainGalleryController", value = "/MainGalleryController")
public class MainGalleryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String action = null;
        String nextPage = "/index2.jsp";
        //get action if action = null send user to home page action=
        action = request.getParameter("action");

        if (action == null) {action = "index";}
        //setup data depending an action and set next page
        switch(action){
            case "index": {
                setUpIndexPageData(request, response, session);
                nextPage = "/index2.jsp";
                break;
            }
                case "createUserForm":{
                nextPage = "/registorUser.jsp";
                break;
            }
            case "createUser":{
                nextPage = getUserCreationData(request, session);
                break;
            }
            case "updateUser":{
                nextPage = getUserDataForUpdate(request, session);
                break;
            }
            case "deleteUser":{
                nextPage = deleteUser(request, session);
                break;
            }
                        case "saveUserDetails":{
                nextPage = saveUserData(request, session);
            }
            }//end switch

        gotoPage(nextPage, request, response);


    }

    private String deleteUser(HttpServletRequest request, HttpSession session) {
        String nextPage;
        //delete current user
        User u = (User) session.getAttribute("User");
        u.deleteUser();
        //delete user object from session
        session.setAttribute("User", null);
        nextPage = "/index2.jsp";
        return nextPage;
    }

    private String saveUserData(HttpServletRequest request, HttpSession session) {
        String nextPage;
        //update User object with new details
        User u = (User) session.getAttribute("User");
        u.setFirstName(request.getParameter("FirstName"));
        u.setSurname(request.getParameter("Surname"));
        u.setEmailAddress(request.getParameter("EmailAddress"));
        u.setUserType(request.getParameter("UserType"));
        u.setUserName(request.getParameter("UserName"));
        u.setPassword(request.getParameter("Password"));
        //organization value only set if user is a viewer
        String organization = "";
        if(u.getUserType().compareToIgnoreCase("VIEWER")==0)
            u.setOrganization(request.getParameter("Organization"));

        //update the user data on the database
        u.updateUser();

        //save the new user object in the session
        session.setAttribute("User", u);

        //after update go back to the index page
        nextPage = "/index2.jsp";
        return nextPage;
    }

    private String getUserDataForUpdate(HttpServletRequest request, HttpSession session) {
        String nextPage;
        //send user to form with user data filled in
        //data for form is stored in the user object in session from when the user signed in
        nextPage = "/updateUserDetails.jsp";
        return nextPage;
    }

    private static String getUserCreationData(HttpServletRequest request, HttpSession session) {
        String nextPage;
        //get data from the form i.e the request object
        String firstname = request.getParameter("FirstName");
        String surname = request.getParameter("Surname");
        String emailAddress = request.getParameter("EmailAddress");
        String userType = request.getParameter("UserType");
        String userName = request.getParameter("UserName");
        String password = request.getParameter("Password");
        //organization value only set if user is a viewer
        String organization = "";
        if(userType.compareToIgnoreCase("VIEWER")==0)
            organization = request.getParameter("Organization");

        //create user Object with data
        User u = new User(firstname, surname, emailAddress, userType,userName, password, organization);

        //create User in the database
        u = u.createUser();

        //save user object to session
        session.setAttribute("User", u);

        //send user back to index page with message to say user created;
        nextPage = "/index2.jsp";
        return nextPage;
    }

    private void setUpIndexPageData(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //find recent project for the index page
        Project projects = new Project();
        ArrayList<Project> ProjectGallery= new ArrayList<>();


        ProjectGallery = projects.findAllProjectsRecentFirst();
        session.setAttribute("AllProjectsRecentFirst",ProjectGallery);
        //generate thumbnails for project -
        generateProjectGalleryThumbnail(ProjectGallery);

        //find live shoecases for the index page
        ArrayList<Showcase> ShowcaseGallery= new ArrayList<>();
        Showcase s = new Showcase();
        ShowcaseGallery = s.findAllLiveShowcases();
        //generate thumbnails for showcases -
        generateShowcaseThumbnail(ShowcaseGallery);

        session.setAttribute("AllLiveShowcases",ShowcaseGallery);

    }

    private void generateShowcaseThumbnail(ArrayList<Showcase> ShowcaseGallery) {
        for (Showcase Showcase : ShowcaseGallery) {

            File destinationDir = new File(getServletContext().getRealPath("") + "/resources/images/showcases/thumbnail");
            System.out.println("file path for showcases thumbnails " + destinationDir.getAbsolutePath());
            try {
                Thumbnails.of(getServletContext().getRealPath("")+"/resources/images/showcases/" + Showcase.getImage())
                        .forceSize(1000, 370)
                        .toFiles(destinationDir, Rename.NO_CHANGE);
            } catch (IOException e) {
                System.out.println("Error on showcases thumbnail creation " + e);
            }

        }
    }
    private void generateProjectGalleryThumbnail(ArrayList<Project> projectGallery) {

        for (Project project : projectGallery) {

            File destinationDir = new File(getServletContext().getRealPath("") + "/resources/images/projects/thumbnail");
            System.out.println("file path for thumbnails" + destinationDir.getAbsolutePath());
            try {
                Thumbnails.of(getServletContext().getRealPath("")+"/resources/images/projects/" + project.getProjectImage())
                        .forceSize(200, 200)
                        .toFiles(destinationDir, Rename.NO_CHANGE);
            } catch (IOException e) {
                System.out.println("Error on thumbnail creation " + e);
            }

        }

    }

    public static void DisplayProjects(ArrayList<Project> Gallery) {

        for (Project project : Gallery) {
            project.Print();
        }
    }
    private void gotoPage(String url, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}

