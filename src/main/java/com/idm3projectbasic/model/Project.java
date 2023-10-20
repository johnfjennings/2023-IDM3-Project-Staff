package com.idm3projectbasic.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Project {

  private long projectId;
  private String projectName;
  private String projectDescription;
  private long userId;
  private String category;
  private String projectDescriptionSummary;
  private String projectImage;


  public long getProjectId() {
    return projectId;
  }

  public void setProjectId(long projectId) {
    this.projectId = projectId;
  }


  public String getProjectName() {
    return projectName;
  }

  public void setProjectName(String projectName) {
    this.projectName = projectName;
  }


  public String getProjectDescription() {
    return projectDescription;
  }

  public void setProjectDescription(String projectDescription) {
    this.projectDescription = projectDescription;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }


  public String getProjectDescriptionSummary() {
    return projectDescriptionSummary;
  }

  public void setProjectDescriptionSummary(String projectDescriptionSummary) {
    this.projectDescriptionSummary = projectDescriptionSummary;
  }


  public String getProjectImage() {
    return projectImage;
  }

  public void setProjectImage(String projectImage) {
    this.projectImage = projectImage;
  }

  public void Print(){
    System.out.println("projectId" + this.projectId);
    System.out.println("projectName" + this.projectName);
    System.out.println("project Description" + this.projectDescription);
    System.out.println("project Image" + this.projectImage);
    System.out.println("category" + this.category);
    System.out.println("project Description Summary" + this.projectDescriptionSummary);
    System.out.println("userId" + this.userId);
  }
  public ArrayList<Project> findAllProjectsRecentFirst(){
    ArrayList<Project> allProjects = new ArrayList<Project>();

    Connection c = DatabaseHelper.getConnection();
    String template = "SELECT * FROM `project` ORDER BY CreationDate DESC;";

    if (c != null) {
      try {
        PreparedStatement inserter = c.prepareStatement(template);
        ResultSet resultSet = inserter.executeQuery();
        System.out.println("All Projects");
        while (resultSet.next()) {
          Project p = new Project();
          p.projectId = resultSet.getInt("ProjectID");
          p.projectName = resultSet.getString("ProjectName");
          p.projectDescription = resultSet.getString("projectDescription");
          p.userId = resultSet.getInt("UserID");
          p.category = resultSet.getString("Category");
          p.projectDescriptionSummary = resultSet.getString("ProjectDescriptionSummary");
          p.projectImage = resultSet.getString("ProjectImage");

          allProjects.add(p);
        }
        System.out.println(inserter);
        inserter.close();
        c.close();
      } catch (SQLException ex) {
        System.out.println("Error on findAllProjectsRecentFirst:: " + ex);
      }
    }
    return allProjects;
  }

}
