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
                background-image: url(/images/email-pattern.png);
            }

            nav {
                border-bottom: 1px solid rgba(0, 0, 0, 0.3);
            }

            h1 {
                font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
            }

            .card {
                box-shadow: 0 25px 20px -20px rgba(0, 0, 0, 0.3), 0 0 15px rgba(0, 0, 0, 0.06);
            }

            .card-text {
                line-height: 21px;
                height: 21px;
                overflow: hidden;
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

            footer {
                border-top: 1px solid rgba(0, 0, 0, 0.3);
                margin-top: 15px;
            }

            .qrcode {
                width: 150px;
                height: 150px;
                margin-top: 15px;
                margin-bottom: 5px;
            }

            .about {
                line-height: 180px;
            }
        </style>
    </head>

    <body class="mt-1">
        <nav class="container">
            <div class="row">
                <div class="col-4 pt-1"></div>
                <div class="col-4 text-center">
                    <h1>Hello World</h1>
                </div>
                <#if user??>
                <div class="col-2 d-flex justify-content-end align-items-center">
                    <p class="h2">${user.nickname}</p>
                </div>
                <div class="col-2 d-flex justify-content-end align-items-center">
                    <a href="/writer" class="mb-2 btn btn-lg btn-outline-secondary">发布文章</a>
                <#else>
                <div class="col-4 d-flex justify-content-end align-items-center">
                    <a href="/login" class="mb-2 btn btn-lg btn-outline-secondary">登录</a>
                </div>
                </#if>
            </div>
        </nav>

        <main role="main">
            <div class="container">
                <div class="row">

                    <#list articleList as article>
                    <div class="col-4 mt-3">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">${article.title}</h3>
                            </div>
                            <img src="${article.coverImage}" class="card-img-top">
                            <div class="card-body">

                                <div class="author-area">
                                    <a>
                                        <img src="${article.author.avatar}" class="avatar">
                                        <p class="author">${article.author.nickname}</p>
                                    </a>
                                </div>

                                <p class="card-text text-truncate">${article.content}</p>
                                
                                <div class="statistics-area">
                                    <i class="fa fa-eye"></i> ${article.viewCount}
                                    <i class="fa fa-comments-o"></i> ${article.commentCount}
                                </div>

                                <a class="card-link pull-right" href="/a/${article.id}">查看全文 »</a>
                            </div>
                        </div>
                    </div>
                    </#list>
                </div>
            </div>
        </main>

        <footer class="container">
            <div class="row">
                <div class="offset-2 col-8">
                    <div class="row">
                        <div class="col-4">
                            <img class="qrcode" src="images/erweima.png">
                        </div>
                        <div class="col align-middle">
                            <p class="about">Powered by Mr. Yang，扫描二维码，更多地了解我。</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>