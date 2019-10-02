package br.com.listacompras.adapter;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

import br.com.listacompras.R;
import br.com.listacompras.model.ListaCompra;

/**
 * Criado por Lucas Pinheiro on 27/06/2019.
 */
public class ListaCompraAdapter extends RecyclerView.Adapter<ListaCompraAdapter.MyViewHolder> {

    List<ListaCompra>listasCompras;

    public ListaCompraAdapter(List<ListaCompra> listaCompra) {
        this.listasCompras = listaCompra;

    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {

        View itemLista = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.lista_produtos_adapter,viewGroup,false);
        return new MyViewHolder(itemLista);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder myViewHolder, int i) {

        ListaCompra listaCompra = listasCompras.get(i);
        String nomeProdutoListagem = listaCompra.getNomeProduto()+" "+listaCompra.getMarcaProduto();
        myViewHolder.txtvwListaCompra.setText(nomeProdutoListagem);

    }

    @Override
    public int getItemCount() {
        return this.listasCompras.size();
    }

    public void addItem(String country) {
       // listasCompras.add(country);
        notifyItemInserted(listasCompras.size());
    }

    public void removeItem(int position) {
        listasCompras.remove(position);
        notifyItemRemoved(position);
        notifyItemRangeChanged(position, listasCompras.size());
    }


    public  class MyViewHolder extends RecyclerView.ViewHolder{

        TextView txtvwListaCompra;
        CheckBox ckbx_ListaCompra;
        ImageView imgvw_fotoProduto;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);

            txtvwListaCompra = itemView.findViewById(R.id.txtListaProd);
            ckbx_ListaCompra = itemView.findViewById(R.id.cbx_listaProd);
            imgvw_fotoProduto = itemView.findViewById(R.id.imgvw_fotoProdutoCompra);
        }
    }

}
