import { LightningElement } from 'lwc';
import getRandomRecipe from "@salesforce/apex/lwcSpoonacular.getRandomRecipe";
import getRecipeByIngredients from "@salesforce/apex/lwcSpoonacular.getRecipeByIngredients";
export default class LwcRecipeSearch extends LightningElement {
    recipes = [];
  fetchRandomRecipe() {
    getRandomRecipe()
      .then((data) => {
        this.recipes =
          JSON.parse(data) && JSON.parse(data).recipes
            ? JSON.parse(data).recipes
            : [];
      })
      .catch((error) => {
        console.error(error);
      });
  }

  fetchRecipesByIngredients() {
    const ingredients = this.template.querySelector(".ingredient-input").value;
    getRecipeByIngredients({ ingredients })
      .then((data) => {
        this.recipes = JSON.parse(data);
      })
      .catch((error) => {
        console.error(error);
      });
  }
}