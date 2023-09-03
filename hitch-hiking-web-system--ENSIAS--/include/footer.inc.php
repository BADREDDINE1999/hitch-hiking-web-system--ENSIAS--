    <div class="footer"   style="background-color:#FFFF">
        <div class="container=">
            Covoiturage de l'ENSIAS &agrave; votre service, depuis juillet 2021
            <br />
            &copy; ENSIAS du Limousin -  Ingenierie  GL 1<sup>ère</sup> année
        </div>
    </div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/material.js"></script>
    <script src="js/ripples.js"></script>
    <?php if (!empty($javascripts)) echo $javascripts ?>
    <?php if (!empty($_GET['page']) && $_GET['page'] == 2 && !empty($_GET['user'])) { ?>
    <script>
    if ($('#showPhoneNumber').length) {
        $('#showPhoneNumber').on('click', function() {
            $(this).html("<img src=\"include/telephone.php?num=<?php echo $personne->getPerTel()?>\" alt=\"Numéro\">");
        });
    }
    </script>
    <?php } ?>
    <script>
    $(function() {
        $.material.init();
      });
    </script>
</body>
</html>