import { Component, OnInit, DoCheck } from '@angular/core';
import { MatIconRegistry } from '@angular/material/icon';
import { DomSanitizer } from '@angular/platform-browser';

//Interface
import { TaskList } from '../../model/task-list';

@Component({
  selector: 'app-todo-list',
  templateUrl: './todo-list.component.html',
  styleUrls: ['./todo-list.component.scss'],
})
export class TodoListComponent implements DoCheck {
  public taskList: Array<TaskList> = JSON.parse(
    localStorage.getItem('list') || '[]'
  );

  constructor(
    private matIconRegistry: MatIconRegistry,
    private domSanitizer: DomSanitizer
  ) {
    this.matIconRegistry.addSvgIcon(
      'lixeira',
      this.domSanitizer.bypassSecurityTrustResourceUrl(
        '../../../../../assets/icons/icon_trash.svg'
      )
    );
  }
  ngDoCheck(): void {
    this.setLocarStorage();
  }
  public setLocarStorage() {
    this.taskList.sort(
      (first, last) => Number(first.checked) - Number(last.checked)
    );
    localStorage.setItem('list', JSON.stringify(this.taskList));
  }
  public deleteItemTaskList(index: number) {
    this.taskList.splice(index, 1);
  }
  public deleteAllTask() {
    const confirm = window.confirm('Você deseja realmente deletar tudo?');
    if (confirm) {
      this.taskList = [];
    }
  }
  public setEmitTaskList(event: string) {
    this.taskList.push({ task: event, checked: false });
  }
  public validationInput(event: string, index: number) {
    if (!event.length) {
      const confir = window.confirm('Tarefe esta vazia, deseja deletar?');

      if (confir) {
        this.deleteItemTaskList(index);
      }
    }
  }
}
