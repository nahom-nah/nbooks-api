CREATE or replace FUNCTION public.get_dist_sales_aggregate(start_date timestamptz, end_date timestamptz) 
RETURNS setof pseudo.dist_sale_aggregate 
    LANGUAGE plpgsql IMMUTABLE
    AS $$
begin
    return query (
        select s.distributorid, sum(s.amount * d.value) 
        from public.batch_sale s 
        join public.denomination d on d.id = s.denominationid
        where s.created_at >= start_date and s.created_at <= end_date
        group by(s.distributorid)
    );
end;
$$;