import { Controller } from '@hotwired/stimulus';
import voucher_codes from '../helpers/voucher_codes';

export default class extends Controller {
  static targets = ['input'];

  static values = {
    length:   { type: Number,	default: 8 }, //	Number of characters in a generated code (excluding prefix and postfix)
    count:    { type: Number, default: 1 }, // Number of codes generated.
    charset:  { type: String, default: "alphanumeric" }, //Characters that can appear in the code.
    prefix:   { type: String,	default: "" }, //A text appended before the code.
    postfix:  { type: String, default: "" }, //A text appended after the code.
    pattern:  { type: String, default: "########" }, //A pattern for codes where hashes (#) will be replaced with random characters.
  }

  connect() {
    
  }

  disconnect() {

  }

  generate(e) {
    e.preventDefault();

    var coupon_code = voucher_codes.generate({
      length: this.lenghtValue,
      count: this.countValue,
      charset: this.charsetValue,
      prefix: this.prefixValue,
      postfix: this.postfixValue,
      pattern: this.patternValue,
    });

    this.inputTarget.value = coupon_code;
  }
}