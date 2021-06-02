% ======================================================================= %
% ========== LE SCRIPT DE MISE À JOUR DE VOTRE DOCUMENTATION ============ %
% ======================================================================= %

%                    -------------------------                            %
% Auteurs: Marien Couvertier (script original), Florian Legendre (màj)    %
%                                                                         %
% Objectif: Fournir un espace unique de mise à jour de la documentation   %
% du projet.                                                              %
%                                                                         %
% IMPORTANT: Modifiez les variables globales dans DocGen.m, dans          %
% "properties" selon votre système                                        %
%                    -------------------------                            %

DocGen.noticeGlobalTest();


%% Création de la documentation
DocGen.notice('E:\Git\projects\wip\DocGenTest\codes\Fonctions\Math', false);
DocGen.notice('E:\Git\projects\wip\DocGenTest\codes\Fonctions\Plot', false);
DocGen.notice('E:\Git\projects\wip\DocGenTest\codes\Fonctions\Plot\Video', false);
%DocGen.notice('/home/crex/projects/MatLab_Template/codes/Plot/Video', false);

DocGen.noticeGlobale();

%% Suppression rapide d'une ou plusieurs notices
%DocGen.deleteNotice('/home/crex/projects/MatLab_Template/codes/Plot/Video');