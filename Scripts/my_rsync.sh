#!/bin/sh

# Ce programme me sert à me simplifier la vie comme jamais en faisant une grosse backup de mes données
# depuis mon PC vers mon disque dur externe. Le tout avec la commande "rsync"

# COULEURS
MY_GREEN=$(tput setaf 82)		# Vert clair
MY_RED=$(tput setaf 196)		# Rouge clair
MY_RESET=$(tput sgr 0)			# Couleur d'affichage de texte originelle (selon les paramètres du terminal)
MY_YELLOW=$(tput setaf 226)		# Jaune clair



######################### FONCTIONS INDÉPENDANTES DE L'AVANCÉE DU SCRIPT #########################

g_echo() { g_str=$1; echo "$MY_GREEN$g_str$MY_RESET"; sleep .5; echo ""; }
r_echo() { r_str=$1; echo "$MY_RED$r_str$MY_RESET"; sleep .5; echo ""; }
y_echo() { y_str=$1; echo "$MY_YELLOW$y_str$MY_RESET"; sleep .5; echo ""; }

# Gestion d'erreurs fatales
handle_fatal_errors()
{
	err_str=$1
	advices_str=$2

	r_echo "##### ERREUR FATALE : $err_str #####"
    echo "$advices_str"
	
	exit 1
}



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################### FONCTIONS DÉPENDANTES DE L'AVANCÉE DU SCRIPT ##########################

# Vérification du branchement du disque dur externe
check_if_external_drive_is_plugged()
{
	if test ! "$(ls "/media/dimob/Disque dur")" > /dev/null; then
		handle_fatal_errors "LE DISQUE DUR EXTERNE N'EST PAS BRANCHÉ" \
            "Astuce : Si votre disque dur est reconnu, ouvrez votre explorateur de fichiers, et cliquez sur la partition montée"
	else
		g_echo "Le disque dur externe est branché"
	fi
}



check_if_external_drive_is_plugged
