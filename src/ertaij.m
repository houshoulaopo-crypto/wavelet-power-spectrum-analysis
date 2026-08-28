function dert = ertaij(cwtfreqs,a)
for i = 1:length(cwtfreqs)
    for j = 1:length(cwtfreqs)
        dert(i,j) = 1/a ^2 * cwtfreqs(i) ^2 *cwtfreqs(j)^2;
    end
end