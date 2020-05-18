<!DOCTYPE html>
<html lang="zh-hans">
    <head>
        <meta charset="UTF-8">
        <title>美丽世界</title>
        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="stylesheet" href="/css/font-awesome.min.css">
        <link rel="stylesheet" href="/plugins/editor/css/editormd.min.css">
        <style>
            body {
                margin-top: 15px;
                background-image: url(/images/email-pattern.png);
            }
        </style>
    </head>
    <body>
        <main class="container-fluid">
            <form method="post" action="/writer/article/${type}/<#if type==1>${activeCid}</#if><#if type==2>${article.id}</#if>">
                <div class="form-group row">
                    <div class="col-3">
                        <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">类别</div>
                        </div>
                        <input id="category" type="text" class="form-control" value="${category.name}" readonly>
                        </div>
                    </div>
                    <div class="col">
                        <input id="title" name="title" value="<#if type==2>${article.title}</#if>" type="text" class="form-control" placeholder="标题">
                    </div>
                    <div class="col-1 text-right">
                        <button type="submit" class="btn btn-primary">发布</button>
                    </div>
                </div>
                <div class="form-group">
                    <div id="editor">
                        <textarea id="content" name="content" style="display: none;" placeholder="正文"><#if type==2>${article.content}</#if></textarea>
                    </div>
                </div>
            </form>
        </main>

        <script src="/js/jquery.slim.min.js"></script>
        <script src="/plugins/editor/editormd.min.js"></script>
        <script>
            $(function () {
                var editor = editormd("editor", {
                    width: "100%",
                    height: 620,
                    syncScrolling: "single",
                    path: "/plugins/editor/lib/",
                    saveHTMLToTextarea : true
                });
            });
        </script>
    </body>
</html>