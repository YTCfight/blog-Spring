<!DOCTYPE html>
<html lang="zh-hans">
<head>
    <meta charset="UTF-8">
    <title>美丽世界</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <style>
        body {
            margin-top: 15px;
            margin-bottom: 55px;
            background-image: url(/images/email-pattern.png);
        }

        .cover-image {
            width: 100%;
        }

        .avatar {
            display: block;
            width: 50px;
            height: 50px;
            border-radius: 15px;
            float: left;
        }

        .author-area {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .author {
            margin-left: 73px;
            line-height: 50px;
        }

        .author::after {
            clear: both;
        }

    </style>
</head>

<body>
<div class="container">
    <h6 class="text-center">${message}</h6>
    <p>${stackTrace}</p>
</div>
</body>
</html>