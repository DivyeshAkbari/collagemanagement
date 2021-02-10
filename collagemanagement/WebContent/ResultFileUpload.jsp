<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en" dir="ltr">

<!-- soccer/project/app-setting.html  07 Jan 2020 03:41:29 GMT -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="icon" href="favicon.ico" type="image/x-icon"/>

<title>:: Soccer :: App Settings</title>

<!-- Bootstrap Core and vandor -->
<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/plugins/dropify/css/dropify.min.css">

<!-- Core css -->
<link rel="stylesheet" href="assets/css/main.css"/>
<link rel="stylesheet" href="assets/css/theme1.css"/>
</head>

<body class="font-montserrat">
<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
    </div>
</div>
<!-- Overlay For Sidebars -->

<div id="main_content">

    

    <div class="page">
        <div id="page_top" class="section-body top_dark">
            <div class="container-fluid">
                <div class="page-header">
                    <div class="left">
                        <a href="javascript:void(0)" class="icon menu_toggle mr-3"><i class="fa  fa-align-left"></i></a>
                        <h1 class="page-title">Setting</h1>
                        
                    </div>
                   
                </div>
            </div>
        </div>
        <div class="section-body">
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-lg-12">
                        <div class="d-lg-flex justify-content-between">
                            <ul class="nav nav-tabs page-header-tab">
                               
                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#Invoice_Settings">Upload Invoice</a></li>
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-body">
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-md-12">
                        <div class="tab-content">
                            
                            <div class="tab-pane" id="Invoice_Settings">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">File Upload</h3>
                                        <div class="card-options">
                                            <a href="#" class="card-options-collapse" data-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a>
                                            <a href="#" class="card-options-fullscreen" data-toggle="card-fullscreen"><i class="fe fe-maximize"></i></a>
                                            <a href="#" class="card-options-remove" data-toggle="card-remove"><i class="fe fe-x"></i></a>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label>Invoice prefix</label>
                                                        <input class="form-control" type="email">
                                                    </div>                           
                                                    <input type="file" class="dropify">
                                                    <small class="text-danger">Recommended image size is 200px x 40px</small>
                                                </div>
                                                <div class="col-sm-12 m-t-20 text-right">
                                                    <button type="button" class="btn btn-primary">SAVE</button>
                                                </div>
                                            </div>
                                        </form> 
                                    </div>
                                </div>                                       
                            </div>
    </div>    
</div>

<script src="assets/bundles/lib.vendor.bundle.js"></script>

<script src="assets/plugins/dropify/js/dropify.min.js"></script>

<script src="assets/js/core.js"></script>
<script>
    $(function() {
        "use strict";
        
        $('.dropify').dropify();
    
        var drEvent = $('#dropify-event').dropify();
        drEvent.on('dropify.beforeClear', function(event, element) {
            return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
        });
    
        drEvent.on('dropify.afterClear', function(event, element) {
            alert('File deleted');
        });
    
        $('.dropify-fr').dropify({
            messages: {
                default: 'Glissez-déposez un fichier ici ou cliquez',
                replace: 'Glissez-déposez un fichier ou cliquez pour remplacer',
                remove: 'Supprimer',
                error: 'Désolé, le fichier trop volumineux'
            }
        });
    });
</script>
</body>

<!-- soccer/project/app-setting.html  07 Jan 2020 03:41:29 GMT -->
</html>