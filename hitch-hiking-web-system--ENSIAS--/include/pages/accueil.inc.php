<?php require_once("include/autoload.inc.php"); ?>

<h1>Bienvenue dans Auto'ENSIAS !</h1>
<br>
<div class="row">
    <div class="col-md-4 description-info">
        <div class="row">
            <div class="col-md-12 col-sm-4">
                <img src="image/etape1.png" alt="Ajoutez votre ville" class="img-responsive img-circle">
            </div>
            <div class="col-md-12 col-sm-8">
                <h3>Ajouter votre ville</h3>
                <p>Vous devrez ajouter votre ville s'il n'est pas encore désservie !</p>
            </div>
        </div>
    </div>
    <div class="col-md-4 description-info">
        <div class="row">
            <div class="col-md-12 col-sm-4 col-md-push-0 col-sm-push-8">
                <img src="image/etape2.png" alt="Définissez votre parcours" class="img-responsive img-circle">
            </div>
            <div class="col-md-12 col-sm-8 col-md-pull-0 col-sm-pull-4">
                <h3>Définissez votre parcours</h3>
                <p>Sélectionnez votre ville de départ et votre ville d'arrivée.</p>
            </div>
        </div>
    </div>
    <div class="col-md-4 description-info">
        <div class="row">
            <div class="col-md-12 col-sm-4">
                <img src="image/etape3.png" alt="Proposez votre trajet" class="img-responsive img-circle">
            </div>
            <div class="col-md-12 col-sm-8">
                <h3>Annoncez votre trajet</h3>
                <p>Alors publiez votre annonce !</p>
            </div>
        </div>
    </div>
</div>
</div>
</div>

<?php
if (!isConnected()) {
    ?>
<div class="well">
    <div class="panel-body">
       <!--  <h2>Rejoignez-nous</h2>  -->
        <div class="text-center">
            <p class="lead">Créer un compte</p>
        <!--    <p>Toute une communauté vous attend pour faire connaissance.</p> -->
            <a href="index.php?page=1" class="btn btn-primary">S'inscrire</a>
        </div>
    </div>
    <?php
} else {
    $pdo = new MyPdo();
    $personneManager = new PersonneManager($pdo);
    $user = $personneManager->getPersonneByLogin($_SESSION['user_login']);
    ?>
<div class="well">
    <div class="panel-body">
        <h2>Salut <?php echo $user->getPerPrenom() ?></h2>
        <div class="row">
            <div class="col-sm-6">
                <div class="text-center">
                    <p class="h4">Êtes-vous un automobiliste ?</p>
                    <a href="index.php?page=9" class="btn btn-primary btn-flat">Proposer un trajet</a>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="text-center">
                    <p class="h4">Avez-vous besoin d'un conducteur ?</p>
                    <a href="index.php?page=10" class="btn btn-primary btn-flat">Rechercher un trajet</a>
                </div>
            </div>
        </div>
    </div>
    <?php
}
