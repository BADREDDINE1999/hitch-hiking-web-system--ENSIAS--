<h1>Ajouter un parcours</h1>
<?php

if (!isConnected()) {
    ?>
    <p>Vous devez être connecté pour accéder à cette page.</p>
    <div class="text-center">
        <a href="index.php?page=11" class="btn btn-primary">Accéder à la page de connexion</a>
    </div>
    <?php
} else {

require_once("include/autoload.inc.php");

$pdo = new MyPdo();
$parcoursManager = new ParcoursManager($pdo);
$villeManager = new VilleManager($pdo);
$parcours = $parcoursManager->getAllParcours();

if (empty($_POST['vil_num1']) && empty($_POST['vil_num2'])) {
$villes = $villeManager->getAllVille();
?>
<form action ="#" method ="post">
    <div class="row form-group">
        <div class="col-lg-2">
            <label for="vil_num1">Ville de départ</label>
        </div>
        <div class="col-lg-10">
            <select class="form-control" name="vil_num1" id="vil_num1" required="required">
                <option value="">Sélectionnez la ville</option>
                <?php
                    foreach ($villes as $ville) {
                    ?>
                    <option value="<?php echo $ville->getVilNum() ?>"><?php echo $ville->getVilNom() ?></option>
                    <?php
                    }
                ?>
            </select>
        </div>
    </div>

    <div class="row form-group">
        <div class="col-lg-2">
            <label for="nom">Ville d'arrivée</label>
        </div>
        <div class="col-lg-10">
            <select class="form-control" name="vil_num2" id="vil_num2" required="required">
                <option value="">Sélectionnez la ville</option>
                <?php
                    foreach ($villes as $ville) {
                ?>
                    <option value="<?php echo $ville->getVilNum() ?>"><?php echo $ville->getVilNom() ?></option>
                <?php
                }
                ?>
            </select>
        </div>
    </div>

<!--    <div class="row form-group">
        <div class="col-lg-2">
            <label for="par_km">Nombre de kilomètres</label>
        </div>
        <div class="col-lg-10">
            <input type="number" placeholder="Nombre de kilomètres" class="form-control" name="par_km" min="1" max="1500" title="La distance doit être un entier positif." required="required">
        </div>
    </div>   -->

    <div class="form-group text-center">
        <button type="submit" class="btn btn-primary">Ajouter</button>
    </div>
</form>
<?php
} else {
    if ($_POST['vil_num1'] == $_POST['vil_num2']) {
        ?>
    <p class="alert alert-danger">Vous ne pouvez pas établir de parcours entre deux mêmes villes.</p>
        <?php
    } 

   /*  else if ($_POST['par_km'] > 1500) {
        ?>
    <p class="alert alert-danger">Le kilométrage n'est pas respecté.</p>
        <?php
    } */else {
        $db = new Mypdo();
        $manager = new ParcoursManager($db);

        $parcours = new Parcours (
            array(
               //'par_km' => $_POST['par_km'],
                'vil_num1' => $_POST['vil_num1'],
                'vil_num2' => $_POST['vil_num2']
                )
            );
        $reponse = $manager->add($parcours);

     if (!$reponse) {
        ?>
    <p class="alert alert-warning">Ce parcours est déjà référencé.</p>
        <?php
       } else {
        ?>
    <p class="alert alert-success">Le parcours entre
    <strong><?php echo $villeManager->getVilNom($parcours->getVilNum1()) ?></strong> et
    <strong><?php echo $villeManager->getVilNom($parcours->getVilNum2()) ?></strong> a été ajouté
   .</p>
        <?php
        }
    }   
    ?>
    <div class="text-center">
        <a href="index.php?page=6" class="btn btn-primary btn-flat">Retour à la liste des parcours</a>
    </div>
    <?php
}
}
