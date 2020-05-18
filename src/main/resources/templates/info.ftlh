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
            <img src="${article.coverImage}" class="cover-image mb-3">
            <h1 class="text-center">${article.title}</h1>
            <div class="author-area">
                <a>
                    <img src="${article.author.avatar}" class="avatar">
                    <p class="author">${article.author.nickname}</p>
                </a>
            </div>

            <div class="statistics-area mt-3 mb-3">
                <i class="fa fa-eye"></i> ${article.viewCount}
                <i class="fa fa-comments-o"></i> ${article.commentCount}
            </div>

            <p class="mx-2">${article.content}</p>
            
            <h2 class="mt-3">评论列表</h2>
            <#if user??>
            <form class="form-inline mb-3" method="post" action="/a/${article.id}/comments">
                <div class="form-group">
                    <input type="text" id="content" name="content" form-control placeholder="评论" style="width: 400px;">
                </div>
                <button type="submit" class="ml-3 btn btn-outline-secondary">提交</button>
            </form>
            <form class="form-inline mb-3" method="post" action="/a/${article.id}/delete">
                <div class="form-group">
                    <input type="text" id="content" name="content" form-control placeholder="输入删除的评论内容" style="width: 400px;">
                </div>
                <button type="submit" class="ml-3 btn btn-outline-secondary">删除</button>
            </form>
            </#if>
            <table class="table">
                <tbody>
                    <#list article.commentList as comment>
                    <tr>
                        <td>${comment.user.nickname}</td>
                        <td>${comment.content}</td>
                        <td>${comment.createdAt?string('yyyy-MM-dd HH:mm:ss')}</td>
                    </tr>
                    </#list>
                </tbody>
            </table>
        </div>
    </body>
</html>