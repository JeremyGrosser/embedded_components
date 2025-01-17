------------------------------------------------------------------------------
--                                                                          --
--                     Copyright (C) 2015-2016, AdaCore                     --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

package body Bit_Fields is
   type Convert_8 (As_Array : Boolean := False) is record
      case As_Array is
         when False =>
            Value : UInt8;
         when True =>
            Bits : Bit_Field (0 .. 7);
      end case;
   end record with Unchecked_Union, Size => 8;

   for Convert_8 use record
      Value  at 0 range 0 .. 7;
      Bits   at 0 range 0 .. 7;
   end record;

   type Convert_16 (As_Array : Boolean := False) is record
      case As_Array is
         when False =>
            Value : UInt16;
         when True =>
            Bits : Bit_Field (0 .. 15);
      end case;
   end record with Unchecked_Union, Size => 16;

   for Convert_16 use record
      Value  at 0 range 0 .. 15;
      Bits   at 0 range 0 .. 15;
   end record;

   type Convert_32 (As_Array : Boolean := False) is record
      case As_Array is
         when False =>
            Value : UInt32;
         when True =>
            Bits : Bit_Field (0 .. 31);
      end case;
   end record with Unchecked_Union, Size => 32;

   for Convert_32 use record
      Value  at 0 range 0 .. 31;
      Bits   at 0 range 0 .. 31;
   end record;

   -------------
   -- To_Word --
   -------------

   function To_Word (Bits : Bit_Field) return UInt32 is
      Tmp : Convert_32;
   begin
      Tmp.Bits := Bits;
      return Tmp.Value;
   end To_Word;

   --------------
   -- To_UInt16 --
   --------------

   function To_UInt16 (Bits : Bit_Field) return UInt16 is
      Tmp : Convert_16;
   begin
      Tmp.Bits := Bits;
      return Tmp.Value;
   end To_UInt16;

   -------------
   -- To_UInt8 --
   -------------

   function To_UInt8 (Bits : Bit_Field) return UInt8 is
      Tmp : Convert_8;
   begin
      Tmp.Bits := Bits;
      return Tmp.Value;
   end To_UInt8;

   ------------------
   -- To_Bit_Field --
   ------------------

   function To_Bit_Field (Value : UInt32) return Bit_Field is
      Tmp : Convert_32;
   begin
      Tmp.Value := Value;
      return Tmp.Bits;
   end To_Bit_Field;

   ------------------
   -- To_Bit_Field --
   ------------------

   function To_Bit_Field (Value : UInt16) return Bit_Field is
      Tmp : Convert_16;
   begin
      Tmp.Value := Value;
      return Tmp.Bits;
   end To_Bit_Field;

   ------------------
   -- To_Bit_Field --
   ------------------

   function To_Bit_Field (Value : UInt8) return Bit_Field is
      Tmp : Convert_8;
   begin
      Tmp.Value := Value;
      return Tmp.Bits;
   end To_Bit_Field;
end Bit_Fields;
