package com.idm3projectbasic.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Showcase {

  private long showcaseId;
  private String name;
  private String description;
  private String image;
  private String status;

  public void Print(){
    System.out.println("showcaseId" + this.showcaseId);
    System.out.println("name" + this.name);
    System.out.println("description" + this.description);
    System.out.println("image" + this.image);
    System.out.println("status" + this.status);

  }

  public ArrayList<Showcase> findAllLiveShowcases(){
    ArrayList<Showcase> allLiveShowcases = new ArrayList<Showcase>();

    Connection c = DatabaseHelper.getConnection();
    String template = "SELECT * FROM `showcase` WHERE STATUS = \"live\";";

    if (c != null) {
      try {
        PreparedStatement inserter = c.prepareStatement(template);
        ResultSet resultSet = inserter.executeQuery();
        System.out.println("All Live Showcases");
        while (resultSet.next()) {
          Showcase s = new Showcase();
          s.description = resultSet.getString("description");
          s.name = resultSet.getString("name");
          s.image = resultSet.getString("image");
          s.showcaseId = resultSet.getInt("showcaseId");
          s.status= resultSet.getString("status");
          allLiveShowcases.add(s);
        }
        System.out.println(inserter);
        inserter.close();
        c.close();
      } catch (SQLException ex) {
        System.out.println("Error on findAllLiveShowcases:: " + ex);
      }
    }
    return allLiveShowcases;
  }
  public long getShowcaseId() {
    return showcaseId;
  }

  public void setShowcaseId(long showcaseId) {
    this.showcaseId = showcaseId;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }


  public String getImage() {
    return image;
  }

  public void setImage(String image) {
    this.image = image;
  }


  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

}
