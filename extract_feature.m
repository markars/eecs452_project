% Extracts the area of interest from the input image
function normalized = extract_feature(image)

    % convert to grayscale and binary image
    gray_image = rgb2gray(image);
    BW_threshold = 0.5;
    BW_image = im2bw(gray_image, BW_threshold);
    
    % Get coorindates to extract region of interest
    [row_min, row_max, col_min, col_max] = coordinates(BW_image);
   
    % Display feature extracted image
    extracted = BW_image(row_min:row_max, col_min:col_max);
%     figure;
%     imshow(extracted); title('feature extraction');

    % Normalize feature
    normalized = normalize(extracted);
%     figure;
%     imshow(normalized); title('normalized 9 x 9');
end

% ----------------------------------------------------------------------
function [row_min, row_max, col_min, col_max] = coordinates(image)
    row = size(image,1);
    col = size(image,2);
    
    row_min = 0;
    row_max = 0;
    col_min = 0;
    col_max = 0;
    
    % find the minimum row
    for r = 1:row
        if sum(image(r,:)) ~= col
            row_min = r;
            break
        end
    end
    
    for r = 0:row - 1
        r_bot = row - r;
        if sum(image(r_bot,:)) ~= col
            row_max = r_bot;
            break
        end    
    end
    
    % find the minimum column
    compare = (row_max-row_min+1);
    for c = 1:col
        if sum(image(row_min:row_max,c)) ~= compare
            col_min = c;
            break
        end
    end

    
    for c = 0:col- 1
        c_bot = col - c;
        if sum(image(row_min:row_max,c_bot)) ~= compare
            col_max = c_bot;
            break
        end
    end  
    
%     This way is slightly slower than the above method to get min and max
%     % find the minimum row
%     for r = 1:row
%         for c = 1:col
%             if BW_image(r, c) == 0
%                 row_max = r;
%                 break
%             end
%         end 
%     end
%     
%     for r = 0:row - 1
%         r_bot = row - r;
%         for c = 1:col
%             if BW_image(r_bot, c) == 0
%                 row_min = r_bot;
%                 break
%             end
%         end
%     end
%     
%     % find the minimum column
%     for c = 1:col
%         for r = row_min:row_max
%             if BW_image(r, c) == 0
%                 col_max = c;
%                 break
%             end
%         end 
%     end
%     
%     for c = 0:col - 1
%         c_bot = col - c;
%         for r = row_min:row_max
%             if BW_image(r, c_bot) == 0
%                 col_min = c_bot;
%                 break
%             end
%         end
%     end
end

% ----------------------------------------------------------------------
% normalization of processed image to 9 x 9 image
function new = normalize(image)
    row = size(image,1);
    col = size(image,2);
    
    % image matrix size needs to be multiple of 9: zero-pad
    num = 28; % matrix width and height size
    if mod(row,num) ~= 0 || mod(col,num) ~= 0
        add_r = num-mod(row,num);
        add_c = num-mod(col,num);
        
        image_padded = padarray(image, [add_r  add_c], 1, 'post');
        row = size(image_padded,1);
        col = size(image_padded,2);
%         figure;
%         imshow(image_padded); title('zero padding');
    end
     
    % normalize by box region
    h = row/num;
    w = col/num;
    new = ones(num,num);
    
    for r = 0:num - 1
        for c = 0:num -1
            box = image_padded(1+r*h: (r+1)*h, 1+c*w:(c+1)*w);
            average = mean(mean(double(box)));
            binary_threshold = 0.8;
            if average <= binary_threshold
                new(r+1,c+1) = 0;
            end
        end
    end
end
