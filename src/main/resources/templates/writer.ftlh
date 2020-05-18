<!DOCTYPE html>
<html lang="zh-hans">
    <head>
        <meta charset="UTF-8">
        <title>美丽世界</title>
        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="stylesheet" href="/css/font-awesome.min.css">
        <style>
            body {
                background-image: url(/images/email-pattern.png);
            }

            .writer {
                position: absolute;
                top: 15px;
                bottom: 15px;
                left: 15px;
                right: 15px;
            }

            .category {
                border-right: 1px solid rgba(0, 0, 0, 0.3);
            }

            .list-group-item {
                background-color: rgba(0, 0, 0, 0);
                border-left: 0;
                border-right: 0;
                height: 73px;
                line-height: 73px;
            }
        </style>
    </head>
    <body>
        <div class="container writer">
            <div class="row" style="height: 100%;">
                <div class="col-4 category text-center">
                    <div class="d-flex justify-content-end align-items-center">
                        <a class="btn btn-block btn-lg btn-outline-secondary" href="/">首页</a>
                    </div>

                    <div class="mt-3">
                        <form class="form-inline" action="/c/add" method="post">
                            <div class="form-group mb-2">
                                <label for="category" class="sr-only">类别</label>
                                <input type="text" class="form-control" id="category" name="name" placeholder="请填写类别">
                            </div>
                            <button type="submit" class="ml-2 btn btn-outline-secondary mb-2">新建</button>
                        </form>
                    </div>
                    <div class="mt-3">
                        <form class="form-inline" action="/c/delete" method="post">
                            <div class="form-group mb-2">
                                <label for="category" class="sr-only">类别</label>
                                <input type="text" class="form-control" id="category" name="name" placeholder="请输入删除的类别">
                            </div>
                            <button type="submit" class="ml-2 btn btn-outline-secondary mb-2">删除</button>
                        </form>
                    </div>


                    <ul class="list-group mt-3">
                        <#list categoryList as category>
                            <li class="list-group-item"><a href="/writer?activeCid=${category.id}">${category.name}</a></li>
                        </#list>
                    </ul>
                </div>

                <div class="col">
                    <div class="d-flex justify-content-end align-items-center mb-3">
                        <a class="btn btn-block btn-lg btn-outline-secondary" href="/writer/forward/1/${activeCid}/editor">新建文章</a>
                    </div>



                    <table class="table">
                        <thead>
                            <th scope="col">#</th>
                            <th scope="col">标题</th>
                            <th scope="col">阅读量</th>
                            <th scope="col">修改</th>
                            <th scope="col">删除</th>
                        </thead>
                        <tbody>
                            <#list articleList as article>
                            <tr>
                                <td scope="row">${article.id}</td>
                                <td>${article.title}</td>
                                <td>${article.viewCount}</td>
                                <td><a href="/writer/forward/2/${article.id}/editor">修改</a></td>
                                <td><a href="/writer/${article.id}/delete">删除</a></td>
                            </tr>
                            </#list>
                          </tbody>
                    </table>
                </div>

            </div>
        </div>

        </div>
    </body>
</html>