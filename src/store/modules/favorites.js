const state ={
    favorites: []
}

const mutations = {
    'ADD_TO_FAVORITES'(state, city){
        state.favorites.push(city);
        console.log(state.favorites);
    },
    'DELETE_FROM_FAVORITES'(state, city){
       this.state.favorites = state.favorites.splice(city,1);
    }
}


const actions = {
    addTofavorites({commit}, city) {
        commit('ADD_TO_FAVORITES', city);
    },
    deleteFromFavorites({commit}, city){
        commit('DELETE_FROM_FAVORITES', city);
    }
};

const getters = {
    favorites: state => {
        return state.favorites;
    }
};

export default {
    state,
    mutations,
    actions,
    getters
};