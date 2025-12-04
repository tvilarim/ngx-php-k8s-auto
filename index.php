<?php
$hostname = gethostname();
?>
<!DOCTYPE html>
<html>
<head>
    <title>PHP on Kubernetes</title>
    <style>
        body { font-family: sans-serif; text-align: center; padding-top: 50px; background: #f0f4f8; }
        .card { background: white; padding: 20px; border-radius: 8px; display: inline-block; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        h1 { color: #333; }
        .pod { color: #007bff; font-weight: bold; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Hello from PHP! 🐘</h1>
        <p>Served by Nginx.</p>
        <p>Running on Pod: <span class="pod"><?php echo $hostname; ?></span></p>
        <hr>
        <small>PHP Version: <?php echo phpversion(); ?></small>
    </div>
</body>
</html>
