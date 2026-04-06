// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract ConvertToNegative {
    error TooBig();

    function convertToNegative(uint256 x) external pure returns (int256) {
      // return -x
      // if -x cannot be computed, revert with "TooBig()"
      // do not hardcode any constants
      uint256 beforeConversionLimit = uint256(type(int256).max) + 1;

      if (x > beforeConversionLimit) {
        revert TooBig();
      }

      if (x == beforeConversionLimit) {
        return type(int256).min;
      }

      return -int256(x);
    }
}
