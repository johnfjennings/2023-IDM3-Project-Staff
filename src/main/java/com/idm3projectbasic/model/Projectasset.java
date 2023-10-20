package com.idm3projectbasic.model;


public class Projectasset {

  private long assetId;
  private long projectId;
  private String assetName;
  private String assetDescription;
  private String assetType;
  private String asset;


  public long getAssetId() {
    return assetId;
  }

  public void setAssetId(long assetId) {
    this.assetId = assetId;
  }


  public long getProjectId() {
    return projectId;
  }

  public void setProjectId(long projectId) {
    this.projectId = projectId;
  }


  public String getAssetName() {
    return assetName;
  }

  public void setAssetName(String assetName) {
    this.assetName = assetName;
  }


  public String getAssetDescription() {
    return assetDescription;
  }

  public void setAssetDescription(String assetDescription) {
    this.assetDescription = assetDescription;
  }


  public String getAssetType() {
    return assetType;
  }

  public void setAssetType(String assetType) {
    this.assetType = assetType;
  }


  public String getAsset() {
    return asset;
  }

  public void setAsset(String asset) {
    this.asset = asset;
  }

}
