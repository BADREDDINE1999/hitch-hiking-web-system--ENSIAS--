<?php
    function getEnglishDate($date){
        $membres = explode('/', $date);
        $date = $membres[2].'-'.$membres[1].'-'.$membres[0];
        return $date;
    }

   /* function addJours($date, $nbJours)*/
    function addJours($date){
        $membres = explode('/', $date);
        $date = $membres[2].'-'.$membres[1].'-'.(intval($membres[0])/*+$nbJours*/);
        return $date;
    }

    function isConnected() {
        if (isset ($_SESSION['user_num'], $_SESSION['user_login']))
            return true;
        else
            return false;
    }