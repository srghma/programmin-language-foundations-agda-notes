-- module plfa.Negation where

open import Relation.Binary.PropositionalEquality using (_≡_; refl)
open import Data.Nat using (ℕ; zero; suc)
open import Data.Empty using (⊥; ⊥-elim)
open import Data.Sum using (_⊎_; inj₁; inj₂)
open import Data.Product using (_×_; proj₁; proj₂) renaming (_,_ to ⟨_,_⟩)
open import Function using (_∘_)
-- open import plfa.Isomorphism using (_≃_; ≃-sym; ≃-trans; _≲_; extensionality)

-- open import Relation.Nullary using (¬_)

¬_ : Set → Set
¬ A = A → ⊥

-- NOTE
-- https://github.com/agda/agda-stdlib/blob/master/src/Data/Nat/Base.agda#L30-L32
-- data _≤_ : Rel ℕ 0ℓ where
--   z≤n : ∀ {n}                 → zero  ≤ n
--   s≤s : ∀ {m n} (m≤n : m ≤ n) → suc m ≤ suc n


infix 4 _<_

data _<_ : ℕ → ℕ → Set where

  z<s : ∀ {n : ℕ}
      ------------
    → zero < suc n

  s<s : ∀ {m n : ℕ}
    → m < n
      -------------
    → suc m < suc n

¬¬-intro : ∀ {A : Set}
  → A
    -----
  → ¬ ¬ A
¬¬-intro = λ z z₁ → z₁ z

-- Exercise <-irreflexive (recommended)
-- Using negation, show that strict inequality is irreflexive, that is, n < n holds for no n.
<-irreflexive : ∀ {n : ℕ} -> ¬ (n < n)
<-irreflexive {zero} ()
<-irreflexive {suc n} (s<s n<n) = <-irreflexive n<n

-- or (https://github.com/personal-practice/agda/blob/a2b54ffbbeab2562efbef2596986779330597231/plfa/Negation.agda#L65)
-- <-irreflexive : ∀ {n : ℕ} → ¬ (n < n)
-- <-irreflexive (s<s n<n) = <-irreflexive n<n

-- Exercise trichotomy
-- Show that strict inequality satisfies trichotomy, that is, for any naturals m and n exactly one of the following holds:
-- m < n
-- m ≡ n
-- m > n
-- Here “exactly one” means that not only one of the three must hold, but that when one holds the negation of the other two must also hold.
