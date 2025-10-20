function [xq,centers,p,D] = Lloyd_Max ( x , N , min_value , max_value )

% Epipeda kbantisti.
epipeda = 2^N;

% Arhikopoiisi dianismatwn kentrwn perioxwn kai kvantismenou simatos
xk = zeros ( epipeda , 1 );
xq = zeros ( length(x) , 1 );

% prwto vima:Ipologismos twn arxikwn kentrwn. Epilegoume ta kendra tou omoiomorfou kvantisti.
Delta = (max_value-min_value)./epipeda;
xk(1) = max_value - Delta / 2;
xk(epipeda) = min_value + Delta / 2;
for i = 2 : epipeda - 1
    xk(i) = xk(i - 1) - Delta;
end

iteration = 1;
d = 10;
e = 1.0e-9;

while ( d > e )

    % Ipologismos orion zonon kbantismou
    for i = 1 : epipeda-1
        T(i) = ( xk(i) + xk(i+1) ) / 2;
    end
	
    % Dianisma athroisma gia tous mesous orous pou tha xreiastoun
    % ston ipologismo ton neo kendroidon
    athrisma = zeros ( epipeda , 1 );
	
	%peiramatikes pithanotites emfanisis stathmewn
	p = zeros(epipeda,1);

	emfaniseis = zeros(epipeda,1);
	
    % Ipologismos kbantismenou simatos
    for i = 1 : length(x)
        % Periptoseon ektos orion kbantisis
        if ( x(i) >= max_value )
            xq(i) = xk(1);
            athrisma(1) = athrisma(1) + x(i);
            emfaniseis(1) = emfaniseis(1)+1;
        elseif ( x(i) <= min_value )
            xq(i) = xk(epipeda);
            athrisma(epipeda) = athrisma(epipeda) + x(i);
			emfaniseis(epipeda) = emfaniseis(epipeda)+1;
        else
            % Iipoloipes periptoseis
            oria = [max_value T min_value];
            for j = 1 : epipeda
                if ( x(i) < oria(j) & x(i) >= oria(j+1) )
                    xq(i) = xk(j);
                    athrisma(j) = athrisma(j) + x(i);
					emfaniseis(j) = emfaniseis(j)+1;
					p(j) = p(j) + 1;
                end
            end
        end
    end

    % Ipologismos mesis paramorfosis
    D(iteration) = mean ( (x - xq).^2 );

    % Diafora ton paramorfoseon me to proigoumeno bima tou algorithmou.
    if ( iteration > 1 )
        d = abs ( D(iteration) - D(iteration-1) );
    end

    iteration = iteration + 1;

    for i = 1 : epipeda
		p(i) = p(i)/length(x);
	end
	
    % Ipologismos twn newn kentrwn
    for i = 1 : epipeda
        if emfaniseis(i) > 0
            xk(i) = athrisma(i) / emfaniseis(i);
        end
    end

end
centers = xk;
iteration = iteration-1;
