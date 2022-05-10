export default function getCSSVariableValue(variable) {
  return getComputedStyle(document.documentElement).getPropertyValue(variable);
}
