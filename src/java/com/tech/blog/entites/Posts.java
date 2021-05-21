
package com.tech.blog.entites;


public class Posts {

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getCatId() {
        return catId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getUserId() {
        return userId;
    }

    public Posts(String ptitle, String pContent,int catId,int userId) {
        this.ptitle = ptitle;
        this.pContent = pContent;
        this.userId=userId;
        this.catId=catId;
        
    }
    
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public Posts() {
    }

    public Posts(int pid, String ptitle, String pContent,int catId,int userId) {
        this.pid =pid;
        this.ptitle = ptitle;
        this.pContent = pContent;
        this.userId=userId;
        this.catId=catId;
        
    }
    private int pid;
    private int catId;
    private int userId;
    private String ptitle;
    private String pContent;
    
}
