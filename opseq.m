function[z_new]=opseq(worsto,besto,STO,z)
al=1
    d=find(z==worsto)
    p=1
    h=besto
    for e=1:STO
        bv= ismember(e,d)
        if bv==1
            continue
        else
            dv=find(h==z(e))
            k(p)=dv(1)
            h(dv(1))=1000
            p=p+1
        end
    end
    n=1
      for l=1:STO
          ai=ismember(l,k)
          if ai==1
              continue
          else
              al(n)=l
              n=n+1
              
          end
      end
      z(d)=besto(al)
      z_new=z
      end