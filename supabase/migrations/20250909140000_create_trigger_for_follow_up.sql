CREATE OR REPLACE FUNCTION public.create_follow_up_for_venous_access()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public."follow-ups" (venous_access_id, date)
  VALUES (NEW.id, NEW.implant_date + interval '7 days');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_create_follow_up
AFTER INSERT ON public."venous-accesses"
FOR EACH ROW
EXECUTE FUNCTION public.create_follow_up_for_venous_access();
