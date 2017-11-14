function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

    true_positive = 0;
    true_negative = 0;
    false_positive = 0;
    false_negative = 0;
    for i = 1:size(pval)(1)
        yhat = pval(i) <= epsilon;
        if yhat == 1
            if yhat == yval(i)
                    true_positive = true_positive + 1;
            else 
                    false_positive = false_positive + 1;   
            end

        else

            if yhat == yval(i)
                    true_negative = true_negative + 1;
            else 
                    false_negative = false_negative + 1;   
            end

        end
    end

    precision = true_positive / (true_positive + false_positive);
    recall = false_positive / (false_positive + false_negative);
    F1 =  2 * ((precision * recall) / (precision + recall));
    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
