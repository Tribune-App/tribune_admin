<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width"/>
    <style type="text/css">
        * { margin: 0; padding: 0; font-size: 100%; font-family: 'Avenir Next', "Helvetica Neue", "Helvetica", Helvetica, Arial, sans-serif; line-height: 1.65; }
        img { max-width: 100%; margin: 0 auto; display: block; }
        body, .body-wrap { width: 100% !important; height: 100%; background: #efefef; color: #333; padding-top: 15px;padding-bottom: 15px; border-spacing: 0;}
        a { text-decoration: none; }
        a:hover { text-decoration: underline; }
        .text-center { text-align: center; }
        .text-right { text-align: right; }
        .text-left { text-align: left; }
        .button { display: inline-block; color: #7300E0; background: #FFC841; border: solid #FFC841; border-width: 10px 20px 8px; font-weight: bold; border-radius: 4px; }
        .button:hover { text-decoration: none; }
        h1, h2, h3, h4, h5, h6 { margin-bottom: 20px; line-height: 1.25; }
        h1 { font-size: 32px; }
        h2 { font-size: 28px; }
        h3 { font-size: 24px; }
        h4 { font-size: 20px; }
        h5 { font-size: 16px; }
        p, ul, ol { font-size: 16px; font-weight: normal; margin-bottom: 20px; }
        .inline { margin-bottom: 0px; }
        .container { display: block !important; clear: both !important; margin: 0 auto !important; max-width: 580px !important; background-color: #fff; }
        .container table { width: 100% !important; border-collapse: collapse; }
        .container .masthead { padding: 0px 0; background: #7300E0; color: white; }
        .container .masthead h1 { margin: 0 auto !important; max-width: 90%; text-transform: uppercase; }
        .container .content { background: white; padding: 30px 35px; }
        .container .content.footer { background: none; }
        .container .content.footer p { margin-bottom: 0; color: #888; text-align: center; font-size: 11px; }
        .container .content.footer a { color: #888; text-decoration: none; font-weight: bold; }
        .container .content.footer a:hover { text-decoration: underline; }
        .purple { color: #7300E0 }
        .social { width: 27px; display: inline-block; }
        .inline-block { display: inline-block; }
        .line-height-1-2 { line-height: 1.2; }
		.margin-social-network { margin: 0px 10px 0px 10px; }
        .section-reserva{ background-color: #f7f7f7;padding: 20px 0; max-width: 300px;border-radius: 10px;}
    </style>
</head>
<body>
<table class="body-wrap" style="width: 100% !important; height: 100%; background: #efefef; color: #333; padding-top: 15px;padding-bottom: 15px; border-spacing: 0;">
    
    <tr>
        <td class="container" style="padding: 2.5rem 0;">
            <table class="container-body" style="width: 100% !important;">
                <tr>
                    <td align="center">
                        <h1>¡Tu código de inicio de</h1>
                        <h1>sesión de dos factores!</h1>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="padding: 20px 0;">
                        <h3 style="margin-bottom: 15px;">Hola,</h3>
                        <h3>Ingresar este código</h3>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="padding: 20px 0;">
                        <h1 style="margin-bottom: 25px;"><?php echo $code; ?></h1>
                        <!-- <h1 style="margin-bottom: 5px;"><a href=" <?php echo $url; ?> "><?php echo $url; ?></a></h1> -->
                    </td>
                </tr>
                
            </table>
        </td>
    </tr>
    
</table>
</body>
</html>