f[n_] := (
	If[Length@{##} == 1,
		"g" <> StringJoin @@ Table["o", {n}] <> "al",
		f[n + 1]]
	) &;
g["al"] := "gal";
g[] := f[1];

(* Test *)

g["al"]
g[][]["al"]
g[][][][][][][][][]["al"]
