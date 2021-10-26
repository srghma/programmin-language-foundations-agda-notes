open import Data.Nat using (ℕ; zero; suc)
open import Data.Bool
open import Data.List

record Eq {a} (A : Set a) : Set a where
  field
    _==_ : A → A → Bool

open Eq {{...}} public

instance
  eqList : ∀ {a} {A : Set a} → {{Eq A}} → Eq (List A)
  _==_ {{eqList}} []       []       = true
  _==_ {{eqList}} (x ∷ xs) (y ∷ ys) = x == y && xs == ys
  _==_ {{eqList}} _        _        = false

  eqNat : Eq Nat
  _==_ {{eqNat}} = natEquals

myEqNat : Eq Nat -- instance that always returns true
_==_ {{myEqNat}} = true

ex : Bool
ex = (1 ∷ 2 ∷ []) == (1 ∷ 3 ∷ []) -- returns false

ex1 : Bool
ex1 = (1 ∷ 2 ∷ []) (== {{myEqNat}}) (1 ∷ 3 ∷ []) -- returns true
