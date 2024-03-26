function [i, j, min_chi] = matrix_min(mat)
    cursor = [1, 1];
    [w, h] = size(mat);
    min_chi = mat(cursor);
    while true
        prev = min_chi;
        for k = 1:w
            cur_tmp = mat(k, cursor(2));
            if min_chi > cur_tmp
                min_chi = cur_tmp;
                cursor(1) = k;
            end
        end
        
        for k = 1:h
            cur_tmp = mat(cursor(1), k);
            if min_chi > cur_tmp
                min_chi = cur_tmp;
                cursor(2) = k;
            end
        end
        if prev == min_chi
            break;
        end
    end

    i = cursor(1);
    j = cursor(2);
end

