import Relation.Binary.PropositionalEquality as Eq

open Eq using (_≡_; refl; sym; trans; cong)
open Eq.≡-Reasoning
open import Data.Nat using (ℕ; zero; suc; _+_)
open import Data.Product using (_×_) renaming (_,_ to ⟨_,_⟩)
open import Data.Sum using (_⊎_; inj₁; inj₂)
open import Relation.Nullary using (¬_)
open import Relation.Nullary.Negation using (contraposition)
  renaming (contradiction to ¬¬-intro)
open import Data.Unit using (⊤; tt)
open import Data.Empty using (⊥; ⊥-elim)
open import Data.List using (List; []; _∷_; foldr; map)
open import Function using (_∘_)
-- open import plfa.Relations using (_<_; z<s; s<s)
-- open import plfa.Isomorphism using (_⇔_)

infix 4 _≤_

data _≤_ : ℕ → ℕ → Set where

  z≤n : ∀ {n : ℕ}
      --------
    → zero ≤ n

  s≤s : ∀ {m n : ℕ}
    → m ≤ n
      -------------
    → suc m ≤ suc n

2≤4 : 2 ≤ 4
2≤4 = s≤s (s≤s z≤n)

¬4≤2 : ¬ (4 ≤ 2) -- or (4 ≤ 2) -> ⊥
¬4≤2 (s≤s (s≤s ())) -- absurd pattern, function without body
-- How to construct this proof:
-- 1. ¬4≤2 p = ?
-- 2. ¬4≤2 p = {! p !}
-- 3. ¬4≤2 p = {! p !} -- case split on p using M-c
-- 3. ¬4≤2 (s≤s p) = {! !} -- and continue until you find absurd pattern ()

data Bool : Set where
  true  : Bool
  false : Bool

T : Bool → Set
T true   =  ⊤
T false  =  ⊥

data Dec (A : Set) : Set where
  yes :   A → Dec A
  no  : ¬ A → Dec A

_≤ᵇ_ : ℕ → ℕ → Bool
zero ≤ᵇ n       =  true
suc m ≤ᵇ zero   =  false
suc m ≤ᵇ suc n  =  m ≤ᵇ n

¬s≤z : ∀ {m : ℕ} → ¬ (suc m ≤ zero)
¬s≤z ()

¬s≤s : ∀ {m n : ℕ} → ¬ (m ≤ n) → ¬ (suc m ≤ suc n)
¬s≤s ¬m≤n (s≤s m≤n) = ¬m≤n m≤n

_≤?_ : ∀ (m n : ℕ) → Dec (m ≤ n)
zero  ≤? n                   =  yes z≤n
suc m ≤? zero                =  no ¬s≤z
suc m ≤? suc n with m ≤? n
...               | yes m≤n  =  yes (s≤s m≤n)
...               | no ¬m≤n  =  no (¬s≤s ¬m≤n)

⌊_⌋ : ∀ {A : Set} → Dec A → Bool
⌊ yes x ⌋  =  true
⌊ no ¬x ⌋  =  false

_≤ᵇ′_ : ℕ → ℕ → Bool
m ≤ᵇ′ n  =  ⌊ m ≤? n ⌋

toWitness : ∀ {A : Set} {D : Dec A} → T ⌊ D ⌋ → A
toWitness {A} {yes x} tt  =  x
toWitness {A} {no ¬x} ()

-- TODO: how to make it without passing T ⌊ D ⌋?
-- toWitness' : ∀ {A : Set} (D : Dec A) → A
-- toWitness' {A} (yes x) = x
-- toWitness' {A} (no ¬x) =

fromWitness : ∀ {A : Set} {D : Dec A} → A → T ⌊ D ⌋
fromWitness {A} {yes x} _  =  tt
fromWitness {A} {no ¬x} x  =  ¬x x

≤ᵇ′→≤ : ∀ {m n : ℕ} → T (m ≤ᵇ′ n) → m ≤ n
≤ᵇ′→≤  =  toWitness

≤→≤ᵇ′ : ∀ {m n : ℕ} → m ≤ n → T (m ≤ᵇ′ n)
≤→≤ᵇ′  =  fromWitness

3≤?4 : Dec (3 ≤ 4)
-- 3≤?4 = yes (s≤s (s≤s (s≤s z≤n)))
3≤?4 = 3 ≤? 4

3≤ᵇ′4 : Bool
3≤ᵇ′4 = 3 ≤ᵇ′ 4

3≤4 : 3 ≤ 4
3≤4 = toWitness tt

3+0≤4 : (3 + 0) ≤ 4
3+0≤4 = toWitness tt

0+3≤4 : (0 + 3) ≤ 4
0+3≤4 = toWitness tt

¬5≤4 : ¬ (5 ≤ 4)
¬5≤4 (s≤s (s≤s (s≤s (s≤s ()))))
