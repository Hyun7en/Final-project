<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sticky Header with Attached Div</title>
    <link href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        header {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            background: white;
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }
        main {
            margin-top: 80px; /* Adjust based on header height */
            padding: 20px;
        }
        .attached {
            position: fixed;
            top: 60px; /* Adjust based on header height */
            width: 100%;
            z-index: 999;
            background: white;
            border-bottom: 1px solid #ccc;
            padding: 10px;
        }
        .spacer {
            height: 2000px; /* Just to enable scrolling */
        }
    </style>
</head>
<body>

<header id="main-header">
    <nav class="container-fluid">
        <ul>
            <li><strong>Website Title</strong></li>
        </ul>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#" role="button">Contact</a></li>
        </ul>
    </nav>
</header>

<main class="container">
    <div class="spacer"></div>
    <div id="attachable-div" class="container">
        <h2>Attachable Div</h2>
        <p>This div will attach to the header when it reaches it.</p>
    </div>
    <div class="spacer"></div>
</main>

<script>
    window.addEventListener('scroll', function() {
        const header = document.getElementById('main-header');
        const attachableDiv = document.getElementById('attachable-div');
        const headerBottom = header.getBoundingClientRect().bottom;
        const attachableDivTop = attachableDiv.getBoundingClientRect().top;

        if (attachableDivTop <= headerBottom) {
            attachableDiv.classList.add('attached');
        } else {
            attachableDiv.classList.remove('attached');
        }
    });
</script>

</body>
</html>
