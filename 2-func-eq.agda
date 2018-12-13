import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; refl; cong; sym)
open import Data.Nat using (ℕ; zero; suc)
open import Data.Product using (_×_)

cong-app : ∀ {A B : Set} {f g : A → B}
    → f ≡ g
    ------------------
    → ∀ (x : A) → f x ≡ g x
cong-app refl x = refl

-- _ : ∀ {A B : Set} {f g : A → B} → f ≡ g
-- _ = refl -- error

-- ℓ - level, allows id to work with universes of Set
-- f : ∀ {ℓ} {A : Set ℓ} → A → A
-- f x = x

-- g : ∀ {ℓ} {A : Set ℓ} → A → A
-- g x = x

f : ∀ {A : Set} → A → A
f x = x

g : ∀ {A : Set} → A → A
g x = x

-- feqg : f ≡ g -- error, Unsolved metas at the following locations
-- feqg = ?

feqg : ∀ {A : Set} (x : A) → f x ≡ g x -- works
feqg x = refl

x : ℕ
x = 1

y : ℕ
y = 1

xeqy : x ≡ y -- works
xeqy = refl


-- pro-eq-prod : ∀ {x y : Set} x ≡ y → x × y ≡ x × y
-- pro-eq-prod = ?

data Color : Set where
  Red : Color
  Blue : Color

coprod-eq-coprod : Red ≡ Red
coprod-eq-coprod = refl
