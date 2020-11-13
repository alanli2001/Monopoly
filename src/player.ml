type t = {
  name : string; 
  money : int;
  properties : Property.t list;
  marker : string;
}

let init_new_player name marker = {
  name = name;
  money = 1500;
  properties = [];
  marker = marker;
}

exception UpdateError of string 

let get_name p = p.name 

let get_money p = p.money

let get_marker_type p = p.marker

let get_properties p = p.properties 

let get_property_by_name p name = 
  let property_lst = get_properties p in 
  let rec rec_find_property = function 
    | [] -> None
    | h :: t -> 
      if (Property.get_name h) = name then Some h 
      else rec_find_property t
  in 
  rec_find_property property_lst

let add_property p prop = 
  if not (List.mem prop p.properties) then {p with properties = 
                                                     (prop :: p.properties)}
  else raise (UpdateError "Already owned property")

let remove_property p prop = 
  if (List.mem prop p.properties) then 
    {p with properties = List.filter (fun x -> x <> prop) p.properties} 
  else raise (UpdateError "Player does not own this property") 

let set_name p name = {p with name = name}

let set_money p amt = {p with money = amt}

let set_marker_type p marker = {p with marker = marker}
