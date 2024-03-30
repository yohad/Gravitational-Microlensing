function [cursor, smallest] = matrix_min(mat)
    sz = size(mat);
    cursor = num2cell(ones(size(sz)));
    smallest = mat(cursor{:});
    prev = smallest;

    while true
        % Iterate over all dimensions
        for dim = 1:length(cursor)
            tmp_cursor = cursor;
            % find minimum of current row
            for i = 1:sz(dim)
                tmp_cursor(dim) = {i};
                current_value = mat(tmp_cursor{:});
                if current_value  < smallest
                    smallest = current_value;
                    cursor(dim) = {i};
                end
            end
        end
    if prev == smallest
        break
    end
    prev = smallest;
    end
end

