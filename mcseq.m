function[y_new]=mcseq(besto,worsto,sf)
    pd=find(sf==worsto)
    sf(pd)=besto(pd)
    y_new=sf
end
 
    
 