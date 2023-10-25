<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<script>
    function sendRequestToServlet(newRequest) {
        var xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    // Handle the response from the servlet here
                    var responseText = xhr.responseText;
                    alert("Response from Servlet: " + responseText);
                } else {
                    // Handle any errors here
                    alert("Error: " + xhr.status + " - " + xhr.statusText);
                }
            }
        };

        xhr.open("GET", "newRequest", true);
        xhr.send();
    }

    function confirmDelete() {
        var result = window.confirm("Do you want to delete the user ${User.userName}?");

        if (result === true) {
            sendRequestToServlet("MainGalleryController?action=deleteUser");
            alert("User deleted!");
            //MainGalleryController?action=deleteUser
            // You can add code here to perform the deletion.
        } else {
            alert("User not deleted.");
            // You can add code here to handle the cancel action.
        }
    }
</script>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <link rel="stylesheet" type="text/css" href="resources/css/lcstyle.css">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
<header class="header">
    <a href="#" class="logo">LOGO GOES HERE</a>
    <nav class="nav-items">
        <a href="#">Home</a>
        <a href="#">About</a>
        <a href="#">Contact</a>
        <c:if test = "${User == null}">
        <a href="MainGalleryController?action=createUserForm">Register</a>
        </c:if>
        <c:if test = "${User != null}">
        <a href="#" onclick="confirmDelete()">Delete </a>
        <a href="MainGalleryController?action=updateUser">Update</a>
        </c:if>
        <a href="#" style="color: blue;">Sign-In</a>


        <div class="icon-button">
            <a href="#"><i class="fas fa-user"></i></a>
        </div>

        <div class="icon-button">
            <a href="#"><i class="fas fa-search"></i></a>
        </div>

    </nav>
</header>
<main>




    <!-- Carousel -->
    <div id="demo1" class="carousel slide" data-bs-ride="carousel">

        <!-- Indicators/dots -->

        <div class="carousel-indicators">

            <c:forEach varStatus="status" var="liveShowcase" items="${AllLiveShowcases}">
                <c:if test="${status.first}"><button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button></c:if>

                <c:if test="${!status.first}">
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="${status.index}"></button>
                </c:if>
            </c:forEach>

        </div>

        </div>
        <!-- Carousel -->
        <div id="demo" class="carousel slide" data-bs-ride="carousel">

            <!-- Indicators/dots -->
            <div class="col-lg-4 col-md-2 col-sm-12 mt-3">
                <div class="carousel-indicators">
                    <c:forEach varStatus="status" var="liveShowcase" items="${AllLiveShowcases}">
                        <c:if test="${status.first}"><button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button></c:if>

                        <c:if test="${!status.first}">
                            <button type="button" data-bs-target="#demo" data-bs-slide-to="${status.index}"></button>
                        </c:if>
                    </c:forEach>

                </div>
            </div>

            <!-- The slideshow/carousel -->
            <div class="carousel-inner">
                <c:forEach var="liveShowcase" varStatus="status" items="${AllLiveShowcases}">
                    <c:if test="${status.first}">
                    <div class="carousel-item active">
                    </c:if>
                        <c:if test="${!status.first}">
                             <div class="carousel-item"></c:if>
                        <img src="resources/images/showcases/${liveShowcase.image}" alt="${liveShowcase.name}" class="d-block w-100">
                        <div class="carousel-caption">
                            <h1>${liveShowcase.name}</h1>
                            <a href="#" class="btn btn-primary">Browse the showcase</a>
                        </div>
                    </div>


                </c:forEach>
            </div>

            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>


        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                    <div class="work text-center"> <!-- Added text-center class -->
                        <i class="fas fa-layer-group" style="font-size: 2rem; margin-top: 20px;"></i>
                        <p class="work-heading" style="font-size: 24px;"><strong>Projects</strong></p>
                        <p class="work-text">Our mission is to provide a stage where students can showcase their creativity, skills, and innovative projects to a global audience.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="work text-center"> <!-- Added text-center class -->
                        <i class="fas fa-seedling" style="font-size: 2rem; margin-top: 20px;"></i> <!-- Adjusted icon size -->
                        <p class="work-heading" style="font-size: 24px;"><strong>Connect</strong></p> <!-- Adjusted font size -->
                        <p class="work-text">We are a dynamic platform proudly offered by TUS, dedicated to empowering students and bridging the gap between education and industry.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="work text-center"> <!-- Added text-center class -->
                        <i class="fas fa-circle-nodes" style="font-size: 2rem; margin-top: 20px;"></i>
                        <p class="work-heading" style="font-size: 24px;"><strong>Network</strong></p> <!-- Adjusted font size -->
                        <p class="work-text">If you're an employer seeking the brightest minds, TUS Gallery is your trusted partner on this exciting educational and professional adventure.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-4">
            <h3 class="text-left mb-4">Recently Added Projects</h3>
            <div class="row">
            <c:forEach var="project" items="${AllProjectsRecentFirst}">

                <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                    <div class="card" style="width:400px" style="length:400px">
<%--                        <img class="card-img-top" src="resources/images/projects/${project.projectImage}" alt="Card image">--%>
                            <img class="card-img-top" src="resources/images/projects/${project.projectImage}" alt="Card image">
                        <div class="card-body">
                            <h5 class="card-title">${project.projectName}</h5>
                            <p class="card-text">${project.projectDescriptionSummary}</p>
                            <a href="MainGalleryController?action=getProject&projectID=${project.projectId}" class="btn btn-primary" >See Project</a>
                        </div>
                    </div>
                </div>

                </c:forEach>

            </div>
        <div class="container mt-3">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
            </ul>
        </div>

    </div>
</main>


<footer class="footer">
    <h4 style="color: white;">LOGO GOES HERE</h4><br>
    <div class="copy">© 2023 TUS GALLERY</div>
    </div>


    <div class="bottom-links">
        <div class="links">
            <span>More Info</span>
            <a href="#">Home</a>
            <a href="#">About</a>
            <a href="#">Contact</a>

        </div>

        <div class="links">
            <span>Social Links</span>
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
        </div>
    </div>
    </div>
</footer>


</body>

</html>