%% tree
clc;
clear all;

Tree = {{6, 7}, {{1, 2}, 3, {4, 5}}};

%7 == Tree{1, 1}{1, 2}

Distant = my_path(Tree, 5)
Distant = my_path(Tree, 1);
Distant = my_path(Tree, 2);
Distant = my_path(Tree, 3);
Distant = my_path(Tree, 4);
Distant = my_path(Tree, 6);
Distant = my_path(Tree, 7);





function x = my_path(tree, number)

    if isa(tree, 'cell')
    
        sz = size(tree);

        for k = 1:1:sz(2)
            distance = my_path(tree{1, k}, number);

            if distance ~= -1
                x = distance + 1;
                break
            elseif distance == -1
                x = -1;
                continue
            end
            
        end  

    elseif isa(tree, 'double')
        
         if tree == number
             x = 0;
         else
             x = -1;
         end
    end
end
