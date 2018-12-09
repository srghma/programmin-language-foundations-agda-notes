import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; refl; cong; sym)
open Eq.≡-Reasoning using (begin_; _≡⟨⟩_; _≡⟨_⟩_; _∎)
open import Data.Nat using (ℕ; zero; suc)


_+_ : ℕ → ℕ → ℕ
zero + n = n
suc m + n = suc (m + n)

+-suc : ∀ (m n : ℕ) → m + suc n ≡ suc (m + n)
+-suc zero n =
  begin
    zero + suc n
  ≡⟨⟩
    suc n
  ≡⟨⟩
    suc (zero + n)
  ∎
+-suc (suc m) n =
  begin
    suc m + suc n
  ≡⟨⟩
    suc (m + suc n)
  ≡⟨ cong suc (+-suc m n) ⟩
    suc (suc (m + n))
  ≡⟨⟩
    suc (suc m + n)
  ∎

+-assoc′ : ∀ m n p -> (m + n) + p ≡ m + (n + p)
+-assoc′ zero n p = refl
+-assoc′ (suc m) n p rewrite +-assoc′ m n p = refl

+-identity′ : ∀ (n : ℕ) → n + zero ≡ n
+-identity′ zero = refl
+-identity′ (suc n) rewrite +-identity′ n = refl

+-suc′ : ∀ (m n : ℕ) → m + suc n ≡ suc (m + n)
+-suc′ zero n = refl
+-suc′ (suc m) n rewrite +-suc′ m n = refl

+-comm′ : ∀ (m n : ℕ) → m + n ≡ n + m
+-comm′ m zero rewrite +-identity′ m = refl
+-comm′ m (suc n) rewrite +-suc′ m n | +-comm′ m n = refl

+-swap′ : ∀ m n p -> m + (n + p) ≡ n + (m + p)
+-swap′ zero n p rewrite +-comm′ zero (n + p) = refl -- have no idea how it changed "(zero + (n + p)) ≡ (n + (zero + p))" to "((n + p) + 0) ≡ ((n + p) + 0)"
+-swap′ (suc m) n p rewrite +-suc′ m n | +-suc′ n (m + p) | +-swap′ m n p = refl

+-swap : ∀ m n p -> m + (n + p) ≡ n + (m + p)
+-swap zero n p =
  begin
    zero + (n + p)
  ≡⟨⟩
    n + p
  ≡⟨⟩
    n + (zero + p)
  ∎
+-swap (suc m) n p =
  begin
    suc m + (n + p)
  ≡⟨ +-comm′ (suc m) (n + p) ⟩
    (n + p) + suc m
  ≡⟨ +-suc′ (n + p) m ⟩
    suc ((n + p) + m)
  ≡⟨ cong suc (+-comm′ (n + p) m) ⟩
    suc (m + (n + p))
  ≡⟨ cong suc (+-swap m n p) ⟩
    suc (n + (m + p))
  ≡⟨ sym (+-suc′ n (m + p)) ⟩
    (n + suc (m + p))
  ≡⟨⟩
    n + (suc m + p)
  ∎
