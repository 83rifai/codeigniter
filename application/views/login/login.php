<!DOCTYPE html>
<html class="bootstrap-admin-vertical-centered">
    <head>
        <title>Login :: Codeigniter</title> 
        <!-- This Tittle page --> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="<?=base_url();?>assets/images/ci-icon.png" />

        <!-- Bootstrap -->
        <link rel="stylesheet" media="screen" href="<?=base_url();?>assets/css/bootstrap.min.css">
        <link rel="stylesheet" media="screen" href="<?=base_url();?>assets/css/bootstrap-theme.min.css">

        <!-- Bootstrap Admin Theme -->
        <link rel="stylesheet" media="screen" href="<?=base_url();?>assets/css/bootstrap-admin-theme.css">

        <!-- Custom styles -->
        <style type="text/css">
            .alert{
                margin: 0 auto 20px;
            }
        </style>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
           <script type="text/javascript" src="js/html5shiv.js"></script>
           <script type="text/javascript" src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bootstrap-admin-without-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="alert alert-info">
                        <a class="close" data-dismiss="alert" href="#">&times;</a>
                        Press enter key or click the Submit button
                    </div>
                    <form method="post" action="about.html" class="bootstrap-admin-login-form">
                        <h1 style="color: #fff;">Login</h1>
                        <div class="form-group">
                            <input class="form-control" type="text" name="email" placeholder="E-mail">
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="password" name="password" placeholder="Password">
                        </div>
                        
                        <button class="btn btn-lg btn-primary" type="submit">Submit</button>
                    </form>
                </div>
            </div>
        </div>


        <script type="text/javascript" src="<?=base_url();?>assets/js/jquery-2.0.3.min.js"></script>

        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script type="text/javascript" src="<?=base_url();?>assets/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(function() {
                // Setting focus
                $('input[name="email"]').focus();

                // Setting width of the alert box
                var alert = $('.alert');
                var formWidth = $('.bootstrap-admin-login-form').innerWidth();
                var alertPadding = parseInt($('.alert').css('padding'));

                if (isNaN(alertPadding)) {
                    alertPadding = parseInt($(alert).css('padding-left'));
                }

                $('.alert').width(formWidth - 2 * alertPadding);
            });
        </script>
    </body>
</html>
