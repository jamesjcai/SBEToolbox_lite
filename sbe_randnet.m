function [A] = sbe_randnet(n, p, varargin)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite


psr = inputParser;
defaultType = 'sw';
validTypes = {'sw', 'er'};
checkType = @(x) any(validatestring(x, validTypes));

addRequired(psr, 'n', @isnumeric);
addRequired(psr, 'p', @isnumeric);
addOptional(psr, 'type', defaultType, checkType)
parse(psr, n, p, varargin{:})


switch psr.Results.type
    case 'sw'
        [A] = randnet_sw(psr.Results.n, psr.Results.p);
    case 'er'
        [A] = randnet_er(psr.Results.n, psr.Results.p);
end
