:1
set copyingsdcard=0
set /a translationsserror=0
set version=1.5.7
mode 120,30
@echo off
rem ### Want to create translation for your language? ###
rem ### Download this text file: https://drive.google.com/open?id=0B99PAkYFoBoLUFRERkFNbTBLU3M ###
rem ### And than send me this on discord - KcrPL#4625. It's easy! :) ###
rem But please, don't put your own translations in this file! You may not understand the code and you may broke it!
rem -KcrPL.
chcp 65001
set error4112=0
set filcheck=0
set language=NotDefined
title IOS Patcher for RiiConnect24
set patchingok=1
if exist C:\Users\%username%\Desktop\IOSPatcherDebug.txt goto debug_1
goto begin
:begin
cls

if exist "%appdata%\temprc24.txt" del /q "%appdata%\temprc24.txt"

if %language%==NotDefined goto set_language
if not exist 00000006-31.delta goto error_runtime_error
if not exist 00000006-80.delta goto error_runtime_error
if not exist libWiiSharp.dll goto error_runtime_error
if not exist Sharpii.exe goto error_runtime_error
if not exist WadInstaller.dll goto error_runtime_error
if not exist wget.exe goto error_runtime_error
if not exist xdelta3.exe goto error_runtime_error
set filcheck=1
goto 3
:debug_1
if not defined %output% set output=No output.
cls
echo                                      IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo debug menu
echo.
echo :---------------:
echo Output:
echo %output%
echo :---------------:
echo.
echo 1. Check for runtime files
echo 2. Check system req
echo 3. Load a translation into memory
echo 4. Exit debug menu
echo 5. Exit.
echo 6. Download IOS 31 and IOS 80
echo 7. Delete files/Refresh program.
echo 8. Change coding page to cmd defualt
echo 9. Change coding page to 65001 (UTF-8)
set /p s=Choose: 
if %s%==1 goto debug_runtime
if %s%==2 goto debug_system_Req
if %s%==3 goto set_language
if %s%==4 goto begin
if %s%==5 exit
if %s%==6 goto debug_download
if %s%==7 goto refresh_database
if %s%==8 goto debug_coding_8
if %s%==9 goto debug_coding_utf
goto debug_1
:debug_runtime
set /a tempvariable=0
if not exist 00000006-31.delta set /a tempvariable=1
if not exist 00000006-80.delta set /a tempvariable=1
if not exist libWiiSharp.dll set /a tempvariable=1
if not exist Sharpii.exe set /a tempvariable=1
if not exist WadInstaller.dll set /a tempvariable=1
if not exist wget.exe set /a tempvariable=1
if not exist xdelta3.exe set /a tempvariable=1

if %tempvariable%==1 set output=Files are corrupted. Please download a new package from GitHub or unpack this program!
if %tempvariable%==0 set output=It seems that files are OK!
goto debug_1
:debug_system_Req
set /a tempvariable=0
timeout 1 /nobreak || set /a tempvariable=1 >NUL

if %tempvariable%==0 set output=There should be no problems with this program.
if %tempvariable%==1 set output=Your OS is probably Windows XP. You may experience some problems with this program.
goto debug_1
:refresh_database
cls
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Deleting files.
echo.
echo You are about to delete any temporary files that has been created by this Patcher.
echo.
echo Is that OK?
echo.
echo ҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉
echo                          1. Yes                                                 2. No
set /p s= 
if %s%==1 goto debug_ref
if %s%==2 goto debug_1
goto refresh_database
:debug_ref
cls
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Deleting files.
echo.
del /q IOS31-old.wad >NUL
del /q IOS80-old.wad >NUL
del /q IOS31\00000006.app >NUL
rmdir /q /s IOS31 >NUL
rmdir /q /s IOS80 >NUL
del /q 00000006.app >NUL
del /q IOS80\00000006.app >NUL

set output=OK!
echo Files has been deleted.
echo This program will restart shortly.
ping localhost -n 5 >NUL
goto 1
:debug_coding_8
chcp 852
set output=Coding page change was successfull.goto debug_1
goto debug_1
:debug_coding_utf
chcp 65001
set output=Coding page change was successfull.
goto debug_1
:debug_download
cls
echo Downloading IOS 31...
Sharpii.exe NUSD -ios 31 -v latest -o IOS31-old.wad -wad >NUL
echo Downloading IOS 80...
Sharpii.exe NUSD -ios 80 -v latest -o IOS80-old.wad -wad >NUL
set output=Downloading successfull.
goto debug_download1
:debug_download1
echo Do you want to patch IOS 31 and 80 for RiiConnect?
echo 1. Yes
echo 2. No
set /p s=Choose: 
if %s%==1 goto debug_download_patch
if %s%==2 goto debug_1
goto debug_download_1
:debug_download_patch
Sharpii.exe WAD -u IOS31-old.wad IOS31/ >NUL
Sharpii.exe WAD -u IOS80-old.wad IOS80/ >NUL
move IOS31\00000006.app 00000006.app >NUL
xdelta3.exe -f -d -s 00000006.app 00000006-31.delta IOS31\00000006.app >NUL
move IOS80\00000006.app 00000006.app >NUL
xdelta3.exe -f -d -s 00000006.app 00000006-80.delta IOS80\00000006.app >NUL
mkdir WAD
Sharpii.exe WAD -p IOS31\ WAD\IOS31.wad -fs >NUL
Sharpii.exe WAD -p IOS80\ WAD\IOS80.wad -fs >NUL
del 00000006.app /q >NUL
del IOS31-old.wad /q >NUL
del IOS80-old.wad /q >NUL
rmdir /s /q IOS31 >NUL
rmdir /s /q IOS80 >NUL
set output=Patching and downloading IOS 31, 80 done.
goto debug_1



:error_runtime_error
mode 120,30
cls
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Error.
echo.
echo  %text1%
echo  %text2%
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo.
echo %text3%
pause>NUL
set patchingok=0
goto end
:set_language
set translationsserror=0
mode 120,30
set s=NUL
rem ### Please do not make any changes to this part of code. ###
rem # Please contact me on Discord - KcrPL#4625 ###
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL. v%version%
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Please select your language
echo.
if %s%==NUL echo If you want to exit, press ENTER without typing anything
echo.
echo R. Open RiiConnect24 site in your default browser.
echo.

echo 1. English (Author: KcrPL) (Correction: Seriel)
echo 2. Polish (Author: KcrPL)
echo 3. Deutsch (Author: TimNook) (Correction: Brawl345)
echo 4. Portuguese (Author: Rafael)
echo 5. French (Author: iDroid)
echo 6. Italian (Author: GameCube)
echo 7. Spanish (Author: Artuto)
echo 8. Russian (Author: prosuWANTED)
echo 9. Greek (Author: Fun4TubeGr)
echo.
set /p s=Choose: 
if %s%==r start www.rc24.xyz	
if %s%==R start www.rc24.xyz
if %s%==1 goto set_language_en
if %s%==2 goto set_language_pl
if %s%==3 goto set_language_deu
if %s%==4 goto set_language_braz
if %s%==5 goto set_language_fr
if %s%==6 goto set_language_it
if %s%==7 goto set_language_es
if %s%==8 goto set_language_rus
if %s%==9 goto set_language_gr
if %s%==NUL exit
goto set_language
:set_language_gr
set language=Greek

set text1=Μερικά αρχεία απο το πρόγραμμα χρειάζονται και δεν βρεθηκαν.
set text2=Ξανακατεβάστε το πακέτο αρχείων και δοκιμάστε ξανά.
set text3=Πατήστε Οποιοδήποτε κουμπί για να κλείσετε αυτή την επιδιόρθωση.
set text4=Θέλετε να χρησιμοποιήσετε την προσαρμογή για το Wii η για το WiiU;
set text5=Δυστηχός δεν υποστηρίζεται ακόμα για το Wii U :(
set text6=Εάν αστειεύεστε, κάντε κλικ σε κάτι για να επιστρέψετε.
set text7=Εάν όχι κλειστέ το πρόγραμμα
set text8=Χρηάζεται να γίνει λήψη το IOS 31 και 80.
set text9=Πατήστε Οποιοδήποτε κουμπί για να ξεκινίσει η λήψη.
set text10=Δεν είναι δυνατή η λήψη των αρχείων επειδή η σύνδεσή σας στο Internet είναι απενεργοποιημένη!
set text11=Ενεργοποιήστε τη σύνδεσή σας και κάντε κλικ σε οποιοδήποτε κουμπί για να δοκιμάσετε ξανά.
set text12= Παρακαλώ περιμένετε... γίνεται λήψη των αρχείων...
set text13=Η προσαρμογή εχει ολοκληρωθεί.
set text14=Τα προσαρμοσμένα αρχεία IOS θα βρίσκονται στο φάκελο που ονομάζεται "WAD"
set text15=Παρουσιάστηκε σφάλμα κάτα την προσαρμογή.
set text16=Πατήστε οποιοδήποτε κουμπί για να δοκιμάστε ξανά.
set text17=Ελέγξτε τη σύνδεση στο Internet και δοκιμάστε ξανά.
set text18=Αυτό το πρόβλημα προκaήθηκε πιθανώς από τη σύνδεσή σας στο Internet.
set text19=Θέλετε να αντιφράψετε τα προσαρμοσμένα αρχεία στην κάρτα SD;
set text20=Ναί
set text21=Όχι
set text22=Παρακαλώ περιμένετε...
set text23=Η καρτα SD δεν βρέθηκε κάρτα SD στο σύστημα.
set text24=Παρακαλώ συνδέστε την κάρτα SD και πατίστε οποιοδηποτε κουμπί για να συνεχείσετε.
set text25=Τρέχουσα γράμμα κάρτας SD:
set text26=Θέλετε να αλλάξετε το γράμμα μονάδας κάρτας SD;
set text27=Συνέχεια αντηγραφή αρχιών στην κάρτα SD
set text28=Αλλάη γράμματος μονάδας δίσκου
set text29=Έξοδος
set text30=Πληκτρολογήστε νέο γράμμα μονάδας δίσκου
set text31=Παρουσιάστηκε σφάλμα κατα την αντιγραφή αρχείων.
set text32=Παρακαλώ περιμενέτε... γινέται αντιγραφή
set text33=Τα αρχεία έχουν αντιγραφεί στην κάρτα SD στο φάκελο που ονομάζεται "WAD"
goto begin
:set_language_rus
set language=Russian
if %translationsserror%==1 goto set_language_en

set text1=Некоторые файлы необходимые для работы программы не были найдены.
set text2=Скачайте заново архив с программой и повторите ещё раз.
set text3=Нажмите любую кнопку чтобы закрыть патчер.
set text4=Вы будете использовать этот патчер для Wii или Wii U?
set text5=К сожалению, патчер не будет работать для Wii U.
set text6=Нажмите чего-нибудь чтобы вернуться.
set text7=Если нет, закройте эту программу.
set text8=Нужно скачать IOS 31 и 80.
set text9=Нажмите любую кнопку чтобы начать скачивание.
set text10=Не получается скачать файлы, так как ваш интернет откючён.
set text11=Пожалуйста включите ваш интернет и нажмите любую клавишу, чтобы продожить.
set text12=Пожалуйста подождите, файлы скачиваются... 
set text13=Патч завершён.
set text14=IOS с патчами помещены в папку "WAD".

rem ### Not Completed language ###
set text15=There was an error while patching.
set text16=Press any button to try again.
set text17=Check your internet connection and try again.
set text18=That problem was probably caused by your internet connection.
set text19=Do you want to copy patched files to an SD Card?
set text20=Yes
set text21=No
set text22=Please wait...
set text23=An SD card was not found in the system.
set text24=Please connect SD Card and press any button to try again.
set text25=Current SD Card Letter:
set text26=Do you want to change SD Card drive letter?
set text27=Continue and copy files to SD Card
set text28=Change drive letter
set text29=Exit
set text30=Type in new drive letter
set text31=There was an error while copying files.
set text32=Please wait... copying.
set text33=Files has been copyied to SD Card to folder called "WAD"


goto begin
:set_language_es
set language=Spanish
if %translationsserror%==1 goto set_language_en

set text1=Los archivos necesarios para ejecutar este programa no se han encontrado.
set text2=Vuelve a descargar el programa e intenta de nuevo.
set text3=Presiona cualquier tecla para cerrar el programa.
set text4=Vas a utilizar este programa para Wii o Wii U?
set text5=Desafortunadamente la Wii U no es soportada...
set text6=Si estabas bromeando, presiona una tecla para continuar.
set text7=Si no, cierra este programa.
set text8=Tenemos que descargar el IOS 31 y 80.
set text9=Presiona cualquier tecla para comenzar a descargar.
set text10=No hemos podido descargar los archivos necesarios debido a que tienes desactivada tu conexion a Internet!
set text11=Activa tu conexion y presiona una tecla para continuar.
set text12=Espera un momento... Los archivos se estan descargando...
set text13=Hemos terminado! Parcheo completado.
set text14=Puedes encontrar los archivos parcheados en la carpeta "WAD".

rem ### Not Completed language ###
set text15=There was an error while patching.
set text16=Press any button to try again.
set text17=Check your internet connection and try again.
set text18=That problem was probably caused by your internet connection.
set text19=Do you want to copy patched files to an SD Card?
set text20=Yes
set text21=No
set text22=Please wait...
set text23=An SD card was not found in the system.
set text24=Please connect SD Card and press any button to try again.
set text25=Current SD Card Letter:
set text26=Do you want to change SD Card drive letter?
set text27=Continue and copy files to SD Card
set text28=Change drive letter
set text29=Exit
set text30=Type in new drive letter
set text31=There was an error while copying files.
set text32=Please wait... copying.
set text33=Files has been copyied to SD Card to folder called "WAD"


goto begin
:set_language_it
set language=Italian
if %translationsserror%==1 goto set_language_en

set text1=Alcuni dei file necessari per eseguire questo programma non sono stati trovati.
set text2=Scarica nuovamente il pacchetto e riprova
set text3=Fare clic su qualsiasi pulsante per chiudere il patcher.
set text4=Stai usando questo patcher per Wii o WiiU?
set text5=Purtroppo, non puoi utilizzare questo patcher per Wii U :(
set text6=Se stavi scherzando, fai clic su qualcosa per tornare indietro.
set text7=In caso contrario, chiudere questo programma.
set text8=Dobbiamo scaricare IOS 31 e 80.
set text9=Fare clic su qualsiasi pulsante per procedere al download.
set text10=Non è possibile scaricare i file perché la connessione a Internet è disabilitata!
set text11=Abilita la connessione e fai clic su qualsiasi pulsante per riprovare.
set text12=Attendere ... i file vengono procedere ad essere scaricati ...
set text13=La patchatura è fatta.
set text14=I file IOS installati saranno nella cartella chiamata "WAD".

rem ### Not Completed language ###
set text15=There was an error while patching.
set text16=Press any button to try again.
set text17=Check your internet connection and try again.
set text18=That problem was probably caused by your internet connection.
set text19=Do you want to copy patched files to an SD Card?
set text20=Yes
set text21=No
set text22=Please wait...
set text23=An SD card was not found in the system.
set text24=Please connect SD Card and press any button to try again.
set text25=Current SD Card Letter:
set text26=Do you want to change SD Card drive letter?
set text27=Continue and copy files to SD Card
set text28=Change drive letter
set text29=Exit
set text30=Type in new drive letter
set text31=There was an error while copying files.
set text32=Please wait... copying.
set text33=Files has been copyied to SD Card to folder called "WAD"

goto begin
:set_language_fr
set language=French
if %translationsserror%==1 goto set_language_en

set text1=Un des fichiers nécessaires pour exécuter ce programme n'a pas ete trouvé.
set text2=Téléchargez l'archive a nouveau puis réessayez
set text3=Appuyez sur n'importe quelle touche pour fermer le programme
set text4=Allez-vous utiliser ce patcher pour la Wii ou la Wii U ?
set text5=Malheureusement, ce patcher est incompatible avec la Wii U...
set text6=Si vous blaguiais, appuyez sur une touche pour continuer.
set text7=Si non, fermez le programme.
set text8=Nous devons télécharger les IOS 31 et 80.
set text9=Appuyez sur n'importe quelle touche pour procéder au téléchargement.
set text10=Nous ne pouvons pas télécharger les IOS car votre connexion Internet est inaccessible.
set text11=Rétablissez votre connexion Internet puis appuyez sur n'importe quelle touche.
set text12=Patientez... les fichiers sont en train d'être télécharges...
set text13=Le patchage est terminé
set text14=Les IOS patchés se trouvent dans le dossier "WAD".

rem ### Not Completed language ###
set text15=There was an error while patching.
set text16=Press any button to try again.
set text17=Check your internet connection and try again.
set text18=That problem was probably caused by your internet connection.
set text19=Do you want to copy patched files to an SD Card?
set text20=Yes
set text21=No
set text22=Please wait...
set text23=An SD card was not found in the system.
set text24=Please connect SD Card and press any button to try again.
set text25=Current SD Card Letter:
set text26=Do you want to change SD Card drive letter?
set text27=Continue and copy files to SD Card
set text28=Change drive letter
set text29=Exit
set text30=Type in new drive letter
set text31=There was an error while copying files.
set text32=Please wait... copying.
set text33=Files has been copyied to SD Card to folder called "WAD"


goto begin
:set_language_braz
set language=Portuguese
if %translationsserror%==1 goto set_language_en

set text1=Alguns dos arquivos necessários para rodar o programa, não foram encontrados.
set text2=Baixe o arquivo novamente e tente de novo
set text3=Clique em qualquer botão para fechar o patcher.
set text4=Você vai usar esse patcher para Wii ou WiiU?
set text5=Infelizmente, você não pode utilizar esse patch no Wii U :(
set text6=Se você estava brincando, clique no botão para voltar.
set text7=Se não estava, feche o programa.
set text8=Nós precisamos baixar as IOS 31 e 80.
set text9=Clique em qualquer botão para começar o download.
set text10=Nós não podemos baixar os arquivos pois a sua internet está desligada!
set text11=Ligue a sua internet e tente novamente.
set text12=Por favor espere... Os arquivos estão sendo baixados... 
set text13=O Patching acabou.
set text14=Arquivos de Patched IOS são chamadas de ''WAD''.

rem ### Not Completed language ###
set text15=There was an error while patching.
set text16=Press any button to try again.
set text17=Check your internet connection and try again.
set text18=That problem was probably caused by your internet connection.
set text19=Do you want to copy patched files to an SD Card?
set text20=Yes
set text21=No
set text22=Please wait...
set text23=An SD card was not found in the system.
set text24=Please connect SD Card and press any button to try again.
set text25=Current SD Card Letter:
set text26=Do you want to change SD Card drive letter?
set text27=Continue and copy files to SD Card
set text28=Change drive letter
set text29=Exit
set text30=Type in new drive letter
set text31=There was an error while copying files.
set text32=Please wait... copying.
set text33=Files has been copyied to SD Card to folder called "WAD"


goto begin
:set_language_deu
set language=Deutsch
if %translationsserror%==1 goto set_language_en

set text1=Einige der Dateien, die dieses Programm braucht, um zu funktionieren, wurden nicht gefunden!
set text2=Downloade dieses Paket noch einmal und probiere es erneut!
set text3=Druecke auf irgendeinen Knopf um das Programm zu beenden.
set text4=Benutzt du diesen Patcher fuer die Wii U oder die Wii?
set text5=Leider kannst du diesen Patcher nicht fuer die Wii U benutzen :(
set text6=Wenn du einen Witz gemacht hast, druecke einen Knopf um zurueck zu gehen.
set text7=Wenn nicht, schliesse dieses Programm.
set text8=Wir muessen IOS 31 und 80 herunterladen.
set text9=Drucke irgendeinen Knopf um mit dem download fortzufahren.
set text10=Wir koennen keine Dateien herunterladen, da du nicht mit dem Internet verbunden bist!
set text11=Verbinde dich mit dem Internet und druecke einen Knopf, um es nochmal zu probieren.
set text12=Bitte warte... die Dateien werden heruntergeladen...
set text13=Das Patchen ist abgeschlossen.
set text14=Die gepatchten Dateien befinden sich im "WAD"-Ordner.

rem ### Not Completed language ###
set text15=There was an error while patching.
set text16=Press any button to try again.
set text17=Check your internet connection and try again.
set text18=That problem was probably caused by your internet connection.
set text19=Do you want to copy patched files to an SD Card?
set text20=Yes
set text21=No
set text22=Please wait...
set text23=An SD card was not found in the system.
set text24=Please connect SD Card and press any button to try again.
set text25=Current SD Card Letter:
set text26=Do you want to change SD Card drive letter?
set text27=Continue and copy files to SD Card
set text28=Change drive letter
set text29=Exit
set text30=Type in new drive letter
set text31=There was an error while copying files.
set text32=Please wait... copying.
set text33=Files has been copyied to SD Card to folder called "WAD"

goto begin
:set_language_pl
set language=Polish
if %translationsserror%==1 goto set_language_en

set text1=Pliki które są potrzebne do uruchomienia programu nie zostały znalezione.
set text2=Pobierz tą paczke ponownie oraz spróbuj ponownie.
set text3=Naciśnij dowolny przycisk aby zamknąć ten program
set text4=Czy będziesz używal tego patchera dla Wii czy dla WiiU?
set text5=Niestety nie mozesz używac tego programu dla Wii U :(
set text6=Jezeli żartowales, naciśnij dowolny przycisk aby powrocic do poprzedniego menu.
set text7=Jesli nie, zamknij program.
set text8=Musimy pobrać IOS 31 oraz IOS 80.
set text9=Naciśnij dowolny przycisk aby rozpocząć do pobieranie.
set text10=Nie możemy pobrać plikow ponieważ twoje połaczenie internetowe jest niedostępne!
set text11=Włacz twój internet i nacisnij dowolny przycisk aby spróbować ponownie
set text12=Proszę czekać... pliki są pobierane
set text13=Patchowanie przebiegło pomyślnie.
set text14=Spatchowane pliki IOS bedą w folderze nazwanym "WAD".
set text15=Wystąpił błąd podczas patchowania.
set text16=Naciśnij dowolny przycisk aby spróbować ponownie.
set text17=Sprawdź połączenie internetowe i spróbuj ponownie.
set text18=Ten problem został prawdopodobnie spowodowany problem z połączeniem internetowym.
set text19=Czy chcesz skopiować spatchowane pliki na kartę SD?
set text20=Tak
set text21=Nie
set text22=Proszę czekać...
set text23=Karta SD nie zostałą znaleziona w systemie
set text24=Proszę podłącz kartę SD i naciśnij dowolny przycisk aby spróbować ponownie.
set text25=Aktualna litera karty SD: 
set text26=Czy chcesz zmienić litere karty SD?
set text27=Kontynuuj i skopiuj pliki na kartę SD.
set text28=Zmień literę dysku.
set text29=Wyjdź
set text30=Wpisz nową litere karty SD
set text31=Wystąpił błąd podczas kopiowania pliku.
set text32=Proszę czekać... kopiowanie.
set text33=Pliki zostały skopiowane na kartę SD do folderu nazwanego "WAD"

goto begin
:set_language_en
cls
set text1=Some of the files needed to run this program were not found.
set text2=Redownload the package and try again.
set text3=Click any button to close the patcher.
set text4=Are you gonna be using this patcher for Wii or WiiU?
set text5=Unfortunately, you cannot use this patcher for Wii U :(
set text6=If you were joking, click something to go back.
set text7=If not, close this program.
set text8=We need to download IOS 31 and 80.
set text9=Click any button to proceed to download.
set text10=We cannot download the files because your Internet connection is disabled!
set text11=Enable your connection and click any button to try again.
set text12=Please wait... files are being downloaded... 
set text13=Patching is done.
set text14=Patched IOS files will be in folder called "WAD".
set text15=There was an error while patching.
set text16=Press any button to try again.
set text17=Check your internet connection and try again.
set text18=That problem was probably caused by your internet connection.
set text19=Do you want to copy patched files to an SD Card?
set text20=Yes
set text21=No
set text22=Please wait...
set text23=An SD card was not found in the system.
set text24=Please connect SD Card and press any button to try again.
set text25=Current SD Card Letter:
set text26=Do you want to change SD Card drive letter?
set text27=Continue and copy files to SD Card
set text28=Change drive letter
set text29=Exit
set text30=Type in new drive letter
set text31=There was an error while copying files.
set text32=Please wait... copying.
set text33=Files has been copyied to SD Card to folder called "WAD"

set language=English
goto begin

:DoNotTouchThisSection
set error4112=1
goto error4112
:error_code_error
mode 120,30
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Error.
echo.
echo ERROR.
echo It seems that error has occurred.
echo.
echo It's because this translation is broken. Or file check has failed.
pause>NUL
goto error_code_error

:error_translation_not_completed
mode 120,30
cls
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Error.
echo.
echo It seems that the translation that you've choose is broken/not completed.
echo Missing strings of translation will be now replaced with english strings.
echo.
echo Press any button to continue.
pause>NUL
set /a translationsserror=1
goto begin
:3

mode 120,30
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Configuring
echo.
echo %text4%
echo.
echo ҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉
echo                          1. Wii                                                 2. WiiU
set /p s=Choose: 
if %s%==1 goto 4
if %s%==2 goto error_3
goto 3
:error_3
mode 120,30
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Error.
echo.
echo %text5%
echo.
echo %text6%
echo %text7%
pause>NUL
goto 3
:4
mode 120,30
set instalorder=1
set intrepeat=0
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Info.
echo.
echo %text8%
echo %text9%
echo.
pause>NUL	
goto 5

:5
mode 120,30
if exist WAD rmdir WAD /s /q
cls
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Downloading
echo.
echo %text12%
rem ### Patching ###
Sharpii.exe NUSD -ios 31 -v latest -o IOS31-old.wad -wad >NUL
if not %errorlevel%==0 goto error_patching
Sharpii.exe NUSD -ios 80 -v latest -o IOS80-old.wad -wad >NUL
if not %errorlevel%==0 goto error_patching
Sharpii.exe WAD -u IOS31-old.wad IOS31/ >NUL
if not %errorlevel%==0 goto error_patching
Sharpii.exe WAD -u IOS80-old.wad IOS80/ >NUL
move IOS31\00000006.app 00000006.app >NUL
if not %errorlevel%==0 goto error_patching
xdelta3.exe -f -d -s 00000006.app 00000006-31.delta IOS31\00000006.app >NUL
if not %errorlevel%==0 goto error_patching
move IOS80\00000006.app 00000006.app >NUL
if not %errorlevel%==0 goto error_patching
xdelta3.exe -f -d -s 00000006.app 00000006-80.delta IOS80\00000006.app >NUL
if not %errorlevel%==0 goto error_patching
mkdir WAD
if not %errorlevel%==0 goto error_patching
Sharpii.exe WAD -p IOS31\ WAD\IOS31.wad -fs >NUL
if not %errorlevel%==0 goto error_patching
Sharpii.exe WAD -p IOS80\ WAD\IOS80.wad -fs >NUL
if not %errorlevel%==0 goto error_patching
del 00000006.app /q >NUL
if not %errorlevel%==0 goto error_patching
del IOS31-old.wad /q >NUL
if not %errorlevel%==0 goto error_patching
del IOS80-old.wad /q >NUL
if not %errorlevel%==0 goto error_patching
rmdir /s /q IOS31 >NUL
if not %errorlevel%==0 goto error_patching
rmdir /s /q IOS80 >NUL
rem ### Patching Done ###
goto ask_for_copy_to_an_sd_card
:error_patching
mode 120,30
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Error.
echo.
echo %text15%
echo %text16%
echo.
echo %text18%
echo %text17%
pause>NUL
goto 4
:ask_for_copy_to_an_sd_card
mode 120,30
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] SD Card
echo.
echo %text13%
echo %text19%
echo.
echo ҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉
echo                          1. %text20%                                                 2. %text21%
set /p s= 
if %s%==1 goto sd_card_check
if %s%==2 goto end
goto ask_for_copy_to_an_sd_card
:sd_card_check
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] SD Card
echo.
set sdcard=NotDefined
echo %text22%
goto sd_a
:sd_a
set /a check=0
if exist A:\private\wii set /a check=%check%+1
if exist A:\apps set /a check=%check%+1
if %check%==2 set sdcard=A
goto sd_b 
:sd_b
set /a check=0
if exist B:\private\wii set /a check=%check%+1
if exist B:\apps set /a check=%check%+1
if %check%==2 set sdcard=B
goto sd_c
:sd_c
set /a check=0
if exist C:\private\wii set /a check=%check%+1
if exist C:\apps set /a check=%check%+1
if %check%==2 set sdcard=C
goto sd_d
:sd_d
set /a check=0
if exist D:\private\wii set /a check=%check%+1
if exist D:\apps set /a check=%check%+1
if %check%==2 set sdcard=D
goto sd_e
:sd_e
set /a check=0
if exist E:\private\wii set /a check=%check%+1
if exist E:\apps set /a check=%check%+1
if %check%==2 set sdcard=E
goto sd_f
:sd_f
set /a check=0
if exist F:\private\wii set /a check=%check%+1
if exist F:\apps set /a check=%check%+1
if %check%==2 set sdcard=F
goto sd_g
:sd_g
set /a check=0
if exist G:\private\wii set /a check=%check%+1
if exist G:\apps set /a check=%check%+1
if %check%==2 set sdcard=G
goto sd_h
:sd_h
set /a check=0
if exist H:\private\wii set /a check=%check%+1
if exist H:\apps set /a check=%check%+1
if %check%==2 set sdcard=H
goto sd_i
:sd_i
set /a check=0
if exist I:\private\wii set /a check=%check%+1
if exist I:\apps set /a check=%check%+1
if %check%==2 set sdcard=J
goto sd_j
:sd_j
set /a check=0
if exist J:\private\wii set /a check=%check%+1
if exist J:\apps set /a check=%check%+1
if %check%==2 set sdcard=J
goto sd_k
:sd_k
set /a check=0
if exist K:\private\wii set /a check=%check%+1
if exist K:\apps set /a check=%check%+1
if %check%==2 set sdcard=K
goto sd_l
:sd_l
set /a check=0
if exist L:\private\wii set /a check=%check%+1
if exist L:\apps set /a check=%check%+1
if %check%==2 set sdcard=L
goto sd_m
:sd_m
set /a check=0
if exist M:\private\wii set /a check=%check%+1
if exist M:\apps set /a check=%check%+1
if %check%==2 set sdcard=M
goto sd_n
:sd_n
set /a check=0
if exist N:\private\wii set /a check=%check%+1
if exist N:\apps set /a check=%check%+1
if %check%==2 set sdcard=N
goto sd_o
:sd_o
set /a check=0
if exist O:\private\wii set /a check=%check%+1
if exist O:\apps set /a check=%check%+1
if %check%==2 set sdcard=O
goto sd_p
:sd_p
set /a check=0
if exist P:\private\wii set /a check=%check%+1
if exist P:\apps set /a check=%check%+1
if %check%==2 set sdcard=P
goto sd_r
:sd_r
set /a check=0
if exist R:\private\wii set /a check=%check%+1
if exist R:\apps set /a check=%check%+1
if %check%==2 set sdcard=R
goto sd_s
:sd_s
set /a check=0
if exist S:\private\wii set /a check=%check%+1
if exist S:\apps set /a check=%check%+1
if %check%==2 set sdcard=S
goto sd_t
:sd_t
set /a check=0
if exist T:\private\wii set /a check=%check%+1
if exist T:\apps set /a check=%check%+1
if %check%==2 set sdcard=T
goto sd_u
:sd_u
set /a check=0
if exist U:\private\wii set /a check=%check%+1
if exist U:\apps set /a check=%check%+1
if %check%==2 set sdcard=U
goto sd_w
:sd_w
set /a check=0
if exist W:\private\wii set /a check=%check%+1
if exist W:\apps set /a check=%check%+1
if %check%==2 set sdcard=W
goto sd_x
:sd_x
set /a check=0
if exist X:\private\wii set /a check=%check%+1
if exist X:\apps set /a check=%check%+1
if %check%==2 set sdcard=X
goto sd_y
:sd_y
set /a check=0
if exist Y:\private\wii set /a check=%check%+1
if exist Y:\apps set /a check=%check%+1
if %check%==2 set sdcard=Y
goto sd_z
:sd_z
set /a check=0
if exist Z:\private\wii set /a check=%check%+1
if exist Z:\apps set /a check=%check%+1
if %check%==2 set sdcard=Z
goto sd_card_show
:sd_card_show
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] SD Card
echo.
if %sdcard%==NotDefined echo %text23%
if %sdcard%==NotDefined echo %text24%
if not %sdcard%==NotDefined goto sd_card_defined
pause>NUL
goto ask_for_copy_to_an_sd_card
:sd_card_defined
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] SD Card
echo.
echo %text25% %sdcard%
echo %text26%
echo.
echo ҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉
echo 1. %text27%             2. %text28%                  3. %text29%
set /p s=
if %s%==1 goto sd_card_copying
if %s%==2 goto change_sd_card_letter
if %s%==3 goto ask_for_copy_to_an_sd_card
goto sd_card_defined
:change_sd_card_letter
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] SD Card
echo.
echo %text25% %sdcard%
echo.
echo %text30% (e.g H)
set /p sdcard=
goto sd_card_defined
:sd_card_error
mode 120,30
cls
echo.	
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Error.
echo.
echo %text31%
pause
goto ask_for_copy_to_an_sd_card
:sd_card_copying
set /a copyingsdcard=1
set /a errorcopying=0
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] SD Card
echo.
echo %text32%
copy "WAD" "%sdcard%:\" >NUL || set /a errorcopying=1
if %errorcopying%==1 goto sd_card_error
goto end


:end
set /a exiting=10
set /a timeouterror=1
timeout 1 /nobreak >NUL && set /a timeouterror=0
goto end1
:end1
mode 120,30
cls
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo  [*] Thanks for using that Patcher! :)
echo.
if %patchingok%==1 echo %text13%
if %patchingok%==1 echo %text14%
echo.
if %copyingsdcard%==1 echo %text33%
echo.
echo Exiting the patcher in...
if %exiting%==10 echo :----------: 10
if %exiting%==9 echo :--------- : 9
if %exiting%==8 echo :--------  : 8
if %exiting%==7 echo :-------   : 7
if %exiting%==6 echo :------    : 6
if %exiting%==5 echo :-----     : 5
if %exiting%==4 echo :----      : 4
if %exiting%==3 echo :---       : 3
if %exiting%==2 echo :--        : 2
if %exiting%==1 echo :-         : 1
if %exiting%==0 echo :          :
if %copyingsdcard%==0 if %exiting%==0 start WAD
if %copyingsdcard%==1 if %exiting%==0 start %sdcard%:\WAD
if %exiting%==0 exit
if %timeouterror%==0 timeout 1 /nobreak >NUL
if %timeouterror%==1 ping localhost -n 2 >NUL
set /a exiting=%exiting%-1
goto end1