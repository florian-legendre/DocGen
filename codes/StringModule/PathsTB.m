% ======================================================================= %
% ========================= LA TOOLBOX DOCGEN =========================== %
% ======================================================================= %

%                    -------------------------                            %
% Auteurs: Florian Legendre (script original)                             %
%                                                                         %
% Objectif: Fournir des méthodes permettant de manipuler des chaînes de   %
%           caractères représentant des chemins absolus.                  %
%                                                                         %
%                    -------------------------                            %


%%  Le code source
classdef PathsTB 
    methods(Static)
        function pathFilesSep = setgetVar(config)
            persistent PATH_FILES_SEP;
            if nargin            
                PATH_FILES_SEP = config;
            end
            pathFilesSep = PATH_FILES_SEP;
        end
        
        % ============== LA BOITE A OUTILS ============== %
        function nodePath = concatSubpathFromNodesRow(pathRow, start, stop)
            subPathUptoNode = pathRow(1, [start:stop]);
            nodePath = strjoin(subPathUptoNode, PathsTB.setgetVar);
        end
        
        function subPathsList = cropPaths(pathsList, pattern)
            nbPaths = numel(pathsList);
            for i=1:nbPaths
                subPathsList{i} = erase(pathsList{i}, pattern);
            end
        end
        
        function nodeName = cropToLastNode(path)
            htap = flip(path);
            emanelif = strtok(htap, PathsTB.setgetVar);
            nodeName = flip(emanelif);
        end
        
        function matchingPathsList = excludeFromPathsList(pattern, filesList) 
            h=0;
            nbHtmlFiles = numel(filesList);
            
            for i=1:nbHtmlFiles
                if ~contains(filesList(i, 1), pattern)
                    h = h+1;
                    matchingPathsList{h,1} = filesList(i, 1);
                end
            end
        end
        
        function matchingPathsStruct = excludeFromPathsStruct(pattern, filesStruct) 
            h=0;
            nbHtmlFiles = numel(filesStruct);
            
            for i=1:nbHtmlFiles
                if isempty(strfind(filesStruct(i, 1).name, pattern))
                    h = h+1;
                    matchingPathsStruct{h,1} = filesStruct(i, 1).name;
                end
            end
        end
        
        function explodedSubpath = explodeSubpath(subPath, explodeDelimiter)
            explodedSubpath = regexp(subPath, explodeDelimiter, 'split');
        end
        
        function matchingPathsList = selectFromPaths(pattern, filename)
            htmlList=importdata(filename);
            
            h=0;
            nbHtmlFiles = numel(htmlList);
            for i=1:nbHtmlFiles
                A{i,1}=strfind(htmlList{i,1}, pattern);
                if ~isempty(A{i,1})
                    h = h+1;
                    matchingPathsList{h,1} = htmlList{i,1};
                end
            end
        end 
    end
end