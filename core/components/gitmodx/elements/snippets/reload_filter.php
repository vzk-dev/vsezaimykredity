<?php
if($_GET['r_a']==1){
    $output = '
    <script>
    $(document).ready(function () {
        console.log("!!!");
        mSearch2.submit();
    });
    </script>
    ';
    $modx->regClientScript($output, true);
}